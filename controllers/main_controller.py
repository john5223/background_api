from bottle import request, route, view, get, post, template
import json
from globals import config

#async tasks
from services.background_tasks import long_running_task

@get('/')
def home(mongodb):
	return template('home')

@route('/background_job')
def background_job(mongodb, seconds=10):
	seconds = int(request.query.get("seconds", seconds))
	res = long_running_task.apply_async((seconds,))
	return {'id': res.task_id}
    

@route('/background_job/<task_id>')
def background_job(mongodb, task_id=''):
	task = long_running_task.AsyncResult(task_id)
	ret = {}
	if task.state == "PENDING":
		ret['progress'] = 0
	elif task.state == "PROGRESS":
		ret['progress'] = task.result['process_percent']
	else:
		ret['result'] = task.result
	return ret
