from flask import *
from modules.publikasi_dosen.Publikasi_dosenModel import *

class Publikasi_dosenView:
    
    @staticmethod
    def index():
        data = Publikasi_dosenModel().publikasi_dosen_all()
        return render_template('publikasi_dosen_index.html',data=data)
    
    @staticmethod
    def dosen():
        data = Publikasi_dosenModel().get_dosen()
        return render_template('dosen.html', data=data)

    @staticmethod
    def create():
        id_dosen = request.form['id_dosen']
        nidn = request.form['nidn']
        nama_awal = request.form['nama_awal']
        nama_akhir = request.form['nama_akhir']
        return render_template('publikasi_dosen_create.html', id_dosen=id_dosen, nidn=nidn, nama_awal=nama_awal, nama_akhir=nama_akhir)
    
    @staticmethod
    def store():
        obj = Publikasi_dosenModel()
        post = request.form
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