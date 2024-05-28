from flask import Flask
from modules.data_alumni.Data_alumniRoute import app_data_alumni
from modules.publikasi_dosen.Publikasi_dosenRoute import app_publikasi_dosen

app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_data_alumni, url_prefix='/data_alumni')
app.register_blueprint(app_publikasi_dosen, url_prefix='/publikasi_dosen')

if __name__ =='__main__':
    app.run(debug=True)