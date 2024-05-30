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
        obj.nim = post['nim']
        obj.nama = post['nama']
        Tugas_akhir_mahasiswaModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
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
            obj.nim = post['nim']
            obj.nama = post['nama']
            Data_alumniaModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
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