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
        obj.id_publikasi_dosen = post['id_publikasi_dosen']
        obj.tgl_publikasi = post['tgl_publikasi']
        obj.judul = post['judul']
        obj.jenis_publikasi = post['jenis_publikasi']
        obj.id_dosen = post['id_dosen']
        Publikasi_dosenModel().store(obj)
        flash('Data Berhasil Ditambahkan', 'success')
        return redirect('/publikasi_dosen')
    
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
            obj.id_publikasi_dosen = post['id_publikasi_dosen']
            obj.tgl_publikasi = post['tgl_publikasi']
            obj.judul = post['judul']
            obj.jenis_publikasi = post['jenis_publikasi']
            obj.id_dosen = post['id_dosen']
            Publikasi_dosenModel().update(id, obj)
            flash('Data Berhasil Diperbarui', 'success')
            return redirect('/publikasi_dosen')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Publikasi_dosenModel().find(id)
        if data:
            Publikasi_dosenModel().delete(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/publikasi_dosen')
        else: 
            return redirect(request.referrer)