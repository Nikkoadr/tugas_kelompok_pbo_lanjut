from functools import wraps
from flask import session, redirect, url_for, flash, abort

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'email' not in session:
            flash('Login dikit boss!')
            return redirect('/login_page')
        return f(*args, **kwargs)
    return decorated_function

def role_required(id_grup):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'id_grup' in session:
                session_id_grup = session['id_grup']
                if session_id_grup == id_grup:
                    return f(*args, **kwargs)
            abort(403)  # Unauthorized
        return decorated_function
    return decorator