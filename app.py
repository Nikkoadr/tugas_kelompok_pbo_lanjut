from flask import *
from modules.auth.LoginRoute import app_login
from modules.tugas_akhir_mahasiswa.Tugas_akhir_mahasiswaRoute import app_tugas_akhir_mahasiswa
from modules.data_alumni.Data_alumniRoute import app_data_alumni
from modules.publikasi_dosen.Publikasi_dosenRoute import app_publikasi_dosen
from modules.manajemen_wisuda.Manajemen_wisudaRoute import app_manajemen_wisuda
from modules.alumni_career_center.Alumni_career_centerRoute import app_alumni_career_center

app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_login, url_prefix='/')
app.register_blueprint(app_tugas_akhir_mahasiswa, url_prefix='/tugas_akhir_mahasiswa')
app.register_blueprint(app_data_alumni, url_prefix='/data_alumni')
app.register_blueprint(app_publikasi_dosen, url_prefix='/publikasi_dosen')
app.register_blueprint(app_manajemen_wisuda, url_prefix='/manajemen_wisuda')
app.register_blueprint(app_alumni_career_center, url_prefix='/alumni_career_center')

if __name__ =='__main__':
    app.run(debug = True)