from flask import Flask
from modules.data_alumni.Data_alumniRoute import app_data_alumni
from modules.publikasi_dosen.Publikasi_dosenRoute import app_publikasi_dosen
from modules.alumni_career_center.Alumni_career_centerRoute import app_alumni_career_center
from modules.manajemen_wisuda.Manajemen_wisudaRoute import app_manajemen_wisuda


app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_data_alumni, url_prefix='/data_alumni')
app.register_blueprint(app_publikasi_dosen, url_prefix='/publikasi_dosen')
app.register_blueprint(app_alumni_career_center, url_prefix='/alumni_career_center')
app.register_blueprint(app_manajemen_wisuda, url_prefix='/manajemen_wisuda')

if __name__ =='__main__':
    app.run(debug=True)