from flask import *
from modules.publikasi_dosen.Publikasi_dosenModel import *

class Publikasi_dosenView:
    
    @staticmethod
    def index():
        data = Publikasi_dosenModel().all()
        return render_template('publikasi_dosen_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('publikasi_dosen_create.html')
    
    @staticmethod
    def store():
        obj = Publikasi_dosenModel()
        post = request.form
        obj.nim = post['nim']
        obj.nama = post['nama']
        Publikasi_dosenModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
    @staticmethod
    def edit(id):
        obj = Publikasi_dosenModel().find(id)
        return render_template('publikasi_dosen_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Publikasi_dosenModel().find(id)
        if data:
            post = request.form
            obj = Publikasi_dosenModel()
            obj.nim = post['nim']
            obj.nama = post['nama']
            Data_alumniaModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
            return redirect('/data_alumni')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Publikasi_dosenModel().find(id)
        if data:
            Publikasi_dosenModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/data_alumni')
        else: 
            return redirect(request.referrer)