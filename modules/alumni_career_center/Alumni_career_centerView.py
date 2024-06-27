from flask import *
from modules.alumni_career_center.Alumni_career_centerModel import *

class Alumni_career_centerView:
    
    @staticmethod
    def index():
        data = Alumni_career_centerModel().all()
        return render_template('alumni_career_center_index.html',data=data)
    
    @staticmethod
    def create():
        return render_template('alumni_career_center_create.html')
    
    @staticmethod
    def store():
        obj = Alumni_career_centerModel()
        post = request.form
        obj.id_loker = post['id_loker']
        obj.loker = post['loker']
        obj.nama_perusahaan = post['nama_perusahaan']
        obj.tgl_loker = post['tgl_loker']
        obj.ket_loker = post['ket_loker']
        obj.jenis_loker = post['jenis_loker']
        
        Alumni_career_centerModel().store(obj)
        flash('Data Berhasil Ditambahkan', 'success')
        return redirect('/alumni_career_center')
    
    @staticmethod
    def edit(id):
        obj = Alumni_career_centerModel().find(id)
        return render_template('alumni_career_center_edit.html',obj=obj)
    
    @staticmethod
    def update(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            post = request.form
            obj = Alumni_career_centerModel()
            obj.id_loker = post['id_loker']
            obj.loker = post['loker']
            obj.nama_perusahaan = post['nama_perusahaan']
            obj.tgl_loker = post['tgl_loker']
            obj.ket_loker = post['ket_loker']
            obj.jenis_loker = post['jenis_loker']
            
            Alumni_career_centerModel().update(id, obj)
            flash('Data Berhasil Diperbaharui', 'success')
            return redirect('/alumni_career_center')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            Alumni_career_centerModel().delete(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/alumni_career_center')
        else: 
            return redirect(request.referrer)