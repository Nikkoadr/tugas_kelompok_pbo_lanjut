from functools import wraps
from flask import session, redirect, url_for, flash

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'email' not in session:
            flash('Login dikit boss!')
            return redirect('/')
        return f(*args, **kwargs)
    return decorated_function