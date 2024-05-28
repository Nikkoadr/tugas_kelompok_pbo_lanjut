from flask import *
from modules.ta_mahasiswa.Ta_mahasiswaModel import *

class Ta_mahasiswaView:
    
    @staticmethod
    def index():
        data = Ta_mahasiswaModel().get_nama()
        return render_template('index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('create.html')
    
    @staticmethod
    def store():
        mahasiswa_obj = Ta_mahasiswaModel()
        post = request.form
        obj.nim = post['nim']
        obj.nama = post['nama']
        Ta_mahasiswaModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
    @staticmethod
    def edit(mahasiswa_id):
        obj = Ta_mahasiswaModel().find(id)
        return render_template('edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Ta_mahasiswaModel().find(id)
        if data:
            post = request.form
            obj = Ta_mahasiswaModel()
            obj.nim = post['nim']
            obj.nama = post['nama']
            Ta_mahasiswaModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
            return redirect('/ta_mahasiswa')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Ta_mahasiswaModel().find(id)
        if data:
            Ta_mahasiswaModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/ta_mahasiswa')
        else: 
            return redirect(request.referrer)