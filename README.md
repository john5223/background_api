Asynchronous Background Worker API
=====================================

This is an example application to run an asynchronous REST api that can run long running processes in the background. This is accomplished using bottle as the web application framework, and celery as the asynchronous background worker. Thanks to celery, your api can now scale out horizontally with celery workers. And the api is extremely small thanks to bottle being a microframework. The possibilites are endless....

(Python does not do true asynchronous programming because of the GIL-lock. To get around this, you use async libraries (numpy for computation, etc.) or write your own C code to run truly asyncronously. Or, with python, you could run as many processes as the amount of cores you have, and then you will be utilizing all of a multi-core system in pure python. )  


Dependencies
==============
sudo apt-get install python-dev python-pip -y
sudo pip install -r pip-requires.txt



Running the API application
===========================
python background_api.py


Running the workers
===========================
celery worker -A services.background_tasks -l debug

