from flask import *
from modules.tugas_akhir_mahasiswa.Tugas_akhir_mahasiswaView import *

app_tugas_akhir_mahasiswa = Blueprint('app_tugas_akhir_mahasiswa',__name__, template_folder='templates')
app_tugas_akhir_mahasiswa.add_url_rule('/','index', Tugas_akhir_mahasiswaView().index, methods=['GET'])
app_tugas_akhir_mahasiswa.add_url_rule('/create','create',Tugas_akhir_mahasiswaView().create, methods=['GET'])
app_tugas_akhir_mahasiswa.add_url_rule('edit/<int:id>','edit', Tugas_akhir_mahasiswaView().edit, methods=['GET'])
app_tugas_akhir_mahasiswa.add_url_rule('/store','store', Tugas_akhir_mahasiswaView().store, methods=['POST'])
app_tugas_akhir_mahasiswa.add_url_rule('/update/<int:id>', 'update', Tugas_akhir_mahasiswaView().update, methods=['POST'])
app_tugas_akhir_mahasiswa.add_url_rule('delete/<int:id>','delete', Tugas_akhir_mahasiswaView().delete, methods=['GET'])