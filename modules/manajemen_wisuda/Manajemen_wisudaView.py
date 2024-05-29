from flask import *
from modules.manajemen_wisuda.Manajemen_wisudaModel import *

class Manajemen_wisudaView:
    
    @staticmethod
    def index():
        data = Manajemen_wisudaModel().get_nama()
        return render_template('manajemen_wisuda_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('manajemen_wisuda_create.html')
    
    @staticmethod
    def store():
        obj = Manajemen_wisudaModel()
        post = request.form
        obj.nim = post['nim']
        obj.nama = post['nama']
        Data_alumniModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
    @staticmethod
    def edit(id):
        obj = Manajemen_wisudaModel().find(id)
        return render_template('manajemen_wisuda_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Manajemen_wisudaModel().find(id)
        if data:
            post = request.form
            obj = Manajemen_wisudaModel()
            obj.nim = post['nim']
            obj.nama = post['nama']
            Manajemen_wisudaModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
            return redirect('/manajemen_wisuda')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Manajemen_wisudaModel().find(id)
        if data:
            Manajemen_wisudaModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/manajemen_wisuda')
        else: 
            return redirect(request.referrer)