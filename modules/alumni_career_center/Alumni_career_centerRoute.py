from flask import *
from modules.alumni_career_center.Alumni_career_centerView import *

app_alumni_career_center = Blueprint('app_alumni_career_center',__name__, template_folder='templates')
app_alumni_career_center.add_url_rule('/','index', Alumni_career_centerView().index, methods=['GET'])
app_alumni_career_center.add_url_rule('/create','create',Alumni_career_centerView().create, methods=['GET'])
app_alumni_career_center.add_url_rule('edit/<int:id>','edit', Alumni_career_centerView().edit, methods=['GET'])
app_alumni_career_center.add_url_rule('/store','store', Alumni_career_centerView().store, methods=['POST'])
app_alumni_career_center.add_url_rule('/update/<int:id>', 'update', Alumni_career_centerView().update, methods=['POST'])
app_alumni_career_center.add_url_rule('delete/<int:id>','delete', Alumni_career_centerView().delete, methods=['GET'])