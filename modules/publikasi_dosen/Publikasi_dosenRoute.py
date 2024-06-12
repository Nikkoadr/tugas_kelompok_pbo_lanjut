from flask import *
from modules.publikasi_dosen.Publikasi_dosenView import *

app_publikasi_dosen = Blueprint('app_publikasi_dosen',__name__, template_folder='templates')
app_publikasi_dosen.add_url_rule('/','index', Publikasi_dosenView().index, methods=['GET'])
app_publikasi_dosen.add_url_rule('/dosen','dosen', Publikasi_dosenView().dosen, methods=['GET'])
app_publikasi_dosen.add_url_rule('/create','create',Publikasi_dosenView().create, methods=['POST'])
app_publikasi_dosen.add_url_rule('edit/<int:id>','edit', Publikasi_dosenView().edit, methods=['GET'])
app_publikasi_dosen.add_url_rule('/store','store', Publikasi_dosenView().store, methods=['POST'])
app_publikasi_dosen.add_url_rule('/update/<int:id>', 'update', Publikasi_dosenView().update, methods=['POST'])
app_publikasi_dosen.add_url_rule('delete/<int:id>','delete', Publikasi_dosenView().delete, methods=['GET'])