from flask import *
from modules.manajemen_wisuda.Manajemen_wisudaView import *

app_manajemen_wisuda = Blueprint('app_manajemen_wisuda',__name__, template_folder='templates')
app_manajemen_wisuda.add_url_rule('/','index', Manajemen_wisudaView().index, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/create','create', Manajemen_wisudaView().create, methods=['GET'])
app_manajemen_wisuda.add_url_rule('edit/<int:id>','edit', Manajemen_wisudaView().edit, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/store','store', Manajemen_wisudaView().store, methods=['POST'])
app_manajemen_wisuda.add_url_rule('/update/<int:id>', 'update', Manajemen_wisudaView().update, methods=['POST'])
app_manajemen_wisuda.add_url_rule('delete/<int:id>','delete', Manajemen_wisudaView().delete, methods=['GET'])