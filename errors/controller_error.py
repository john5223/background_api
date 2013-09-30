from bottle import error, view


@error('404')
@view('error/error')
def error404(error):
    return {'err_code': '404'}


@error('505') 
@view('error/error')
def error505(error):
    return {'err_code': '505'}


@error('500') 
@view('error/error')
def error505(error):
    return {'err_code': '500'}