from flask import *
from modules.data_alumni.Data_alumniModel import *

class Data_alumniView:
    
    @staticmethod
    def index():
        data = Data_alumniModel().get_nama()
        return render_template('index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('create.html')
    
    @staticmethod
    def store():
        obj = Data_alumniModel()
        post = request.form
        obj.nim = post['nim']
        obj.nama = post['nama']
        Data_alumniModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
    @staticmethod
    def edit(id):
        obj = Data_alumniModel().find(id)
        return render_template('edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Data_alumniModel().find(id)
        if data:
            post = request.form
            obj = Data_alumniModel()
            obj.nim = post['nim']
            obj.nama = post['nama']
            Data_alumniaModel().update(id, obj)
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