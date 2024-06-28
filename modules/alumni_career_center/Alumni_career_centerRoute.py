from flask import *
from modules.alumni_career_center.Alumni_career_centerView import *

app_alumni_career_center = Blueprint('app_alumni_career_center',__name__, template_folder='templates')
app_alumni_career_center.add_url_rule('/','index', Alumni_career_centerView().index, methods=['GET'])

app_alumni_career_center.add_url_rule('/data_pelamar','data_pelamar', Alumni_career_centerView().data_pelamar, methods=['GET'])
app_alumni_career_center.add_url_rule('/tambah_data_pelamar','tambah_data_pelamar', Alumni_career_centerView().tambah_data_pelamar, methods=['GET'])
app_alumni_career_center.add_url_rule('/edit_data_pelamar/<int:id>','edit_data_pelamar', Alumni_career_centerView().edit_data_pelamar, methods=['GET'])
app_alumni_career_center.add_url_rule('/update_data_pelamar/<int:id>','update_data_pelamar', Alumni_career_centerView().update_data_pelamar, methods=['POST'])
app_alumni_career_center.add_url_rule('/hapus_data_pelamar/<int:id>','hapus_data_pelamar', Alumni_career_centerView().hapus_data_pelamar, methods=['GET'])

app_alumni_career_center.add_url_rule('/create','create',Alumni_career_centerView().create, methods=['GET'])
app_alumni_career_center.add_url_rule('edit/<int:id>','edit', Alumni_career_centerView().edit, methods=['GET'])
app_alumni_career_center.add_url_rule('/store','store', Alumni_career_centerView().store, methods=['POST'])
app_alumni_career_center.add_url_rule('/update/<int:id>', 'update', Alumni_career_centerView().update, methods=['POST'])
app_alumni_career_center.add_url_rule('delete/<int:id>','delete', Alumni_career_centerView().delete, methods=['GET'])