from flask import *
from modules.alumni_career_center.Alumni_career_centerModel import *

class Alumni_career_centerView:
    
    @staticmethod
    def index():
        data = Alumni_career_centerModel().all()
        return render_template('alumni_career_center_index.html',data=data) #jsonify(data)
    
    @staticmethod
    def create():
        return render_template('alumni_career_center_create.html')
    
    @staticmethod
    def store():
        obj = Alumni_career_centerModel()
        post = request.form
        obj.nim = post['nim']
        obj.nama = post['nama']
        Alumni_career_centerModel().store(obj)
        flash('Data berhasil ditambahkan', 'success')
        return redirect('/ta_mahasiswa')
    
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
            obj.nim = post['nim']
            obj.nama = post['nama']
            Alumni_career_centerModel().update(id, obj)
            flash('Data berhasil diperbarui', 'success')
            return redirect('/alumni_career_center')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            Alumni_career_centerModel().delete(id)
            flash('Data berhasil dihapus', 'success')
            return redirect ('/alumni_career_center')
        else: 
            return redirect(request.referrer)