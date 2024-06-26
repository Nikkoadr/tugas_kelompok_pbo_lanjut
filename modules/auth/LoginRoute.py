from flask import *
from modules.auth.LoginView import *

app_login = Blueprint('app_login',__name__, template_folder='templates')
app_login.add_url_rule('/','index', LoginView().index, methods=['GET'])
app_login.add_url_rule('/login','login', LoginView().login, methods=['POST'])
app_login.add_url_rule('/home','home', LoginView().home, methods=['GET'])
app_login.add_url_rule('/logout','logout', LoginView().logout, methods=['GET'])