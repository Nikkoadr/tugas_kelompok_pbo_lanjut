from flask import *
from modules.manajemen_wisuda.Manajemen_wisudaView import *

app_manajemen_wisuda = Blueprint('app_manajemen_wisuda',__name__, template_folder='templates')
app_manajemen_wisuda.add_url_rule('/','index', Manajemen_wisudaView().index, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/create','create', Manajemen_wisudaView().create, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/edit/<int:id>','edit', Manajemen_wisudaView().edit, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/store','store', Manajemen_wisudaView().store, methods=['POST'])
app_manajemen_wisuda.add_url_rule('/update/<int:id>', 'update', Manajemen_wisudaView().update, methods=['POST'])
app_manajemen_wisuda.add_url_rule('/delete/<int:id>','delete', Manajemen_wisudaView().delete, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/admin_pendaftar','admin_pendaftar', Manajemen_wisudaView().admin_pendaftar, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/edit_peserta/<int:id>','edit_peserta', Manajemen_wisudaView().edit_peserta, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/update_peserta/<int:id>', 'update_peserta', Manajemen_wisudaView().update_peserta, methods=['POST'])
app_manajemen_wisuda.add_url_rule('/delete_peserta/<int:id>', 'delete_peserta', Manajemen_wisudaView().delete_peserta, methods=['GET'])
app_manajemen_wisuda.add_url_rule('/daftar_wisuda', 'daftar_wisuda', Manajemen_wisudaView().daftar_wisuda, methods=['GET'])
#app_manajemen_wisuda.add_url_rule('/cari', 'cari', Manajemen_wisudaView().cari, methods=['GET'])