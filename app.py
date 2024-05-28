from flask import Flask
from modules.data_alumni.Data_alumniRoute import app_data_alumni

app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_data_alumni, url_prefix='/data_alumni')

if __name__ =='__main__':
    app.run(debug=True)