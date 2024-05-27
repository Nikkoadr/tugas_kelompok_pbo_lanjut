from flask import *
from modules.ta_mahasiswa.Ta_mahasiswaView import *

app_ta_mahasiswa = Blueprint('app_mahasiswa',__name__, template_folder='templates')
app_ta_mahasiswa.add_url_rule('/','index', Ta_mahasiswaView().index, methods=['GET'])
app_ta_mahasiswa.add_url_rule('/create','create',Ta_mahasiswaView().create, methods=['GET'])
app_ta_mahasiswa.add_url_rule('edit/<int:id>','edit', Ta_mahasiswaView().edit, methods=['GET'])
app_ta_mahasiswa.add_url_rule('/store','store', Ta_mahasiswaView().store, methods=['POST'])
app_ta_mahasiswa.add_url_rule('/update/<int:id>', 'update', Ta_mahasiswaView().update, methods=['POST'])
app_ta_mahasiswa.add_url_rule('delete/<int:id>','delete', Ta_mahasiswaView().delete, methods=['GET'])