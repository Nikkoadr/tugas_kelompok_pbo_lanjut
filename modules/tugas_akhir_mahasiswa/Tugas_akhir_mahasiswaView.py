from flask import *
from modules.tugas_akhir_mahasiswa.Tugas_akhir_mahasiswaModel import *

class Tugas_akhir_mahasiswaView:
    
    @staticmethod
    def index():
        data = Tugas_akhir_mahasiswaModel().all()
        return render_template('tugas_akhir_mahasiswa_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('tugas_akhir_mahasiswa_create.html')
    
    @staticmethod
    def store():
        obj = Tugas_akhir_mahasiswaModel()
        post = request.form
        obj.judul = post['judul']
        obj.deskripsi = post['deskripsi']
        obj.status = post['status']
        obj.nilai = post['nilai']
        obj.tanggal_penyerahan = post['tanggal_penyerahan']
        obj.catatan = post['catatan']
        Tugas_akhir_mahasiswaModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/tugas_akhir_mahasiswa')
    
    @staticmethod
    def edit(id):
        obj = Tugas_akhir_mahasiswaModel().find(id)
        return render_template('tugas_akhir_mahasiswa_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Tugas_akhir_mahasiswaModel().find(id)
        if data:
            post = request.form
            obj = Tugas_akhir_mahasiswaModel()
            obj.judul = post['judul']
            obj.deskripsi = post['deskripsi']
            obj.status = post['status']
            obj.nilai = post['nilai']
            obj.tanggal_penyerahan = post['tanggal_penyerahan']
            obj.catatan = post['catatan']
            Tugas_akhir_mahasiswaModel().update(id, obj)
            flash('Data Berhasil Diperbarui', 'success')
            return redirect('/tugas_akhir_mahasiswa')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Tugas_akhir_mahasiswaModel().find(id)
        if data:
            Tugas_akhir_mahasiswaModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/tugas_akhir_mahasiswa')
        else: 
            return redirect(request.referrer)