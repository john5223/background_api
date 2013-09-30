from bottle import route, static_file
from bottle import route, static_file

#===============================================================================
# This controller should only be hit when running bottle as dev for localhost
# In reality, you should have nginx in front of your uWSGI server, and this will
# serve all your static files.
#===============================================================================

@route('/robots.txt')
def static_from_root():
    #===============================================================================
    # Robots.txt for Google web crawlers
    #===============================================================================
    return static_file('robots.txt', root='static')

@route('/static/:path#.+#', name='static')
def static(path):
    return static_file(path, root='static')

@route('/favicon.ico')
def get_favicon():
    return static_file('favicon.ico', root='static')
