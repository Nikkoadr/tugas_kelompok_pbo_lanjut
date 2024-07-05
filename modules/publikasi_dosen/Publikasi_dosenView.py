from flask import *
from modules.publikasi_dosen.Publikasi_dosenModel import *

class Publikasi_dosenView:
    
    @staticmethod
    def index():
        data = Publikasi_dosenModel().publikasi_dosen_all()
        return render_template('publikasi_dosen_index.html',data=data)

    @staticmethod
    def publish_jurnal():
        obj = Publikasi_dosenModel.cari_jurnal_dosen(session['id_dosen'])
        return render_template('publikasi_dosen_create.html', obj=obj)
    
    @staticmethod
    def store():
        obj = Publikasi_dosenModel()
        form = request.form
        obj = Publikasi_dosenModel()
        obj.judul = form['judul']
        obj.jenis = form['jenis']
        obj.tahun = form['tahun']
        obj.abstrak = form['abstrak']
        obj.id_dosen = session['id_dosen']
        obj.status = 'review'
        Publikasi_dosenModel().store(obj)
        flash('Data Berhasil Ditambahkan', 'success')
        return redirect('/home')
    
    @staticmethod
    def edit(id):
        obj = Publikasi_dosenModel().find(id)
        return render_template('publikasi_dosen_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Publikasi_dosenModel().find(id)
        if data:
            form = request.form
            obj = Publikasi_dosenModel()
            obj.judul = form['judul']
            obj.jenis = form['jenis']
            obj.tahun = form['tahun']
            obj.abstrak = form['abstrak']
            obj.status = form['status']
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