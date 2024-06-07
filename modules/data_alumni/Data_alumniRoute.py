from flask import *
from modules.data_alumni.Data_alumniView import *

app_data_alumni = Blueprint('app_data_alumni',__name__, template_folder='templates')
app_data_alumni.add_url_rule('/','index', Data_alumniView().index, methods=['GET'])
app_data_alumni.add_url_rule('/create','create',Data_alumniView().create, methods=['GET'])
app_data_alumni.add_url_rule('/wisuda','wisuda',Data_alumniView().wisuda, methods=['GET'])
app_data_alumni.add_url_rule('/mahasiswa/<int:id>','mahasiswa',Data_alumniView().mahasiswa, methods=['GET'])
app_data_alumni.add_url_rule('/tambah_alumni','tambah_alumni',Data_alumniView().tambah_alumni, methods=['POST'])
app_data_alumni.add_url_rule('edit/<int:id>','edit', Data_alumniView().edit, methods=['GET'])
app_data_alumni.add_url_rule('/store','store', Data_alumniView().store, methods=['POST'])
app_data_alumni.add_url_rule('/update/<int:id>', 'update', Data_alumniView().update, methods=['POST'])
app_data_alumni.add_url_rule('delete/<int:id>','delete', Data_alumniView().delete, methods=['GET'])