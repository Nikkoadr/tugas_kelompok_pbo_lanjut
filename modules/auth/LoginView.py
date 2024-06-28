from flask import *
from modules.auth.LoginModel import *
from utils import login_required

class LoginView:
    @staticmethod
    def index():
        return render_template('welcome.html')

    @staticmethod
    def login_page():
        return render_template('login_index.html')

    @staticmethod
    def login():
        if request.method == 'POST':
            email = request.form['email']
            password = request.form['password']
            user = LoginModel.login(email, password)
            if user:
                session['email'] = user['email']
                session['nama_awal'] = user['nama_awal']
                session['nama_akhir'] = user['nama_akhir']
                return redirect('/home')
            else :
                flash('email dan password salah!')
                return redirect('/')
    
    @staticmethod
    @login_required
    def home():
        return render_template('home.html')

    @staticmethod
    def logout():
        session.pop('email', None)
        session.pop('nama_awal', None)
        return redirect('/')