from gevent import monkey; monkey.patch_all()
import bottle
from bottle import route, get, post, put
import os, sys, re, yaml, json
import logging
logging.basicConfig()

from time import sleep
import globals

APP_NAME = os.path.basename(__file__).split('.')[0]

#===============================================================================
# The following class is used to strip the trailing slash from the request path
# Example: makes /home and /home/ route to /home
class StripPathMiddleware(object):
  def __init__(self, app):
    self.app = app
  def __call__(self, e, h):
    e['PATH_INFO'] = e['PATH_INFO'].rstrip('/')
    return self.app(e,h)

# Load the application path
load_dir = os.path.dirname(os.path.realpath(__file__))
sys.path = [load_dir] + sys.path
os.chdir(load_dir)
app_base = os.path.dirname(os.path.realpath(__file__))
app_base_join = lambda x: os.path.join(os.sep, app_base, x)

#Get config
from config import *
globals.config = config 

# Get app
app = bottle.app()
#Bottle template path
bottle.TEMPLATE_PATH.append(app_base_join('views'))


#Celery
from celery import Celery
#Celery with redis
#celery = Celery("tasks", broker='redis://localhost:6379/0', backend='redis')
#Celery with mongodb
celery = Celery("tasks", broker='mongodb://localhost:27017/celery', backend='mongodb')
globals.celery = celery


#MongoDB
from bottle.ext.mongo import MongoPlugin
plugin = MongoPlugin(uri="mongodb://localhost",db=APP_NAME, json_mongo=True)
app.install(plugin)

#Strip trailing slash
app = StripPathMiddleware(app)

#===============================================================================
#Import application structure
control_dirs = ['controllers', 'errors']
[sys.path.append(dir) for dir in control_dirs]
[__import__(file[:-3])
 for cdir in control_dirs
 for file in os.listdir(app_base_join(cdir))
    if re.match('.*_' + cdir[:-1] + '.py$', file)]


if __name__ == '__main__':
    #===============================================================================
    # Run localhost for dev
    bottle.debug(True)
    logging.basicConfig(level=logging.DEBUG)
    api = config['api_server']
    bottle.run(app=app, host=api['host'], port=api['port'], server='gevent', debug=True)
else:
    #===============================================================================
    # Mod WSGI launch
    application = StripPathMiddleware(app)
