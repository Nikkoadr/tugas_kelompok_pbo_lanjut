from flask import Flask
from modules.data_alumni.Data_alumniRoute import app_data_alumni
from modules.publikasi_dosen.Publikasi_dosenRoute import app_publikasi_dosen
from modules.publikasi_dosen.Publikasi_dosenRoute import app_career_center

app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_data_alumni, url_prefix='/data_alumni')
app.register_blueprint(app_publikasi_dosen, url_prefix='/publikasi_dosen')
app.register_blueprint(app_career_center, url_prefix='/career_center')

if __name__ =='__main__':
    app.run(debug=True)