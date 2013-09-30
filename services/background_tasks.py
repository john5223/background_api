import logging
from time import sleep
from celery import Celery, task, current_task

#Entire application config as available to workers
from config import *

#This is just to show we can import from the application structure
from models import user_model


#Celery with mongodb
celery = Celery("tasks", 
				broker='mongodb://localhost:27017/celery', 
				backend='mongodb')


@celery.task(name="tasks.long_running_task")
def long_running_task(seconds=10):
	for sec in range(0, seconds):
		sleep(1)
		logging.debug(sec)
		#Update percentage complete of the current process
		process_percent = int((float(sec) / seconds) * 100)	
		current_task.update_state(state='PROGRESS',
		    meta={'process_percent': process_percent})		
		
	return "I am a task that waited %s seconds" % seconds


if __name__ == "__main__":
    print "Do not run this file directly. Run celery from top level directory."
    print "celery worker -A services.background_tasks -l debug"
    
    