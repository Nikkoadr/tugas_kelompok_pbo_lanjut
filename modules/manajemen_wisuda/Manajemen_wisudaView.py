from flask import *
from modules.manajemen_wisuda.Manajemen_wisudaModel import *

class Manajemen_wisudaView:
    
    @staticmethod
    def index():
        data = Manajemen_wisudaModel().all()
        return render_template('manajemen_wisuda_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('manajemen_wisuda_create.html')
    
    @staticmethod
    def store():
        obj = Manajemen_wisudaModel()
        post = request.form
        obj.tgl_wisuda = post['tgl_wisuda']
        Manajemen_wisudaModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/manajemen_wisuda')
    
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
            obj.id_wisuda = post['id_wisuda']
            obj.tgl_wisuda = post['tgl_wisuda']
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