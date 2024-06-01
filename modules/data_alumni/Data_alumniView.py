from flask import *
from modules.data_alumni.Data_alumniModel import *

class Data_alumniView:
    
    @staticmethod
    def index():
        data = Data_alumniModel().get_nama()
        return render_template('data_alumni_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('data_alumni_create.html')
        
    @staticmethod
    def mahasiswa():
        data = Data_alumniModel().mahasiswa()
        return render_template('mahasiswa.html', data=data)
    
    @staticmethod
    def tambah_alumni(id):
        data = Data_alumniModel().cari_mahasiswa(id)
        return render_template('data_alumni_create.html', data=data)

    @staticmethod
    def store():
        obj = Data_alumniModel()
        post = request.form
        obj.ipk_lulus = post['ipk_lulus']
        obj.judul_skripsi = post['judul_skripsi']
        obj.no_ijazah = post['no_ijazah']
        obj.perusahaan_kerja = post['perusahaan_kerja']
        Data_alumniModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
    @staticmethod
    def edit(id):
        obj = Data_alumniModel().find(id)
        return render_template('data_alumni_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Data_alumniModel().find(id)
        if data:
            post = request.form
            obj = Data_alumniModel()
            obj.ipk_lulus = post['ipk_lulus']
            obj.judul_skripsi = post['judul_skripsi']
            obj.no_ijazah = post['no_ijazah']
            obj.perusahaan_kerja = post['perusahaan_kerja']
            Data_alumniModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
            return redirect('/data_alumni')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Data_alumniModel().find(id)
        if data:
            Data_alumniModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/data_alumni')
        else: 
            return redirect(request.referrer)