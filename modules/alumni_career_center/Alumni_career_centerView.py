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
        obj.id_mahasiswa = post['id_mahasiswa']
        obj.id_wisuda = post['id_wisuda']
        obj.tgl_yudisium = post['tgl_yudisium']
        obj.ipk_lulus = post['ipk_lulus']
        obj.judul_skripsi = post['judul_skripsi']
        obj.bidang_kerja = post['bidang_kerja']
        obj.no_ijazah = post['no_ijazah']
        obj.perusahaan_kerja = post['perusahaan_kerja']
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
            obj.id_mahasiswa = post['id_mahasiswa']
            obj.id_wisuda = post['id_wisuda']
            obj.tgl_yudisium = post['tgl_yudisium']
            obj.ipk_lulus = post['ipk_lulus']
            obj.judul_skripsi = post['judul_skripsi']
            obj.bidang_kerja = post['bidang_kerja']
            obj.no_ijazah = post['no_ijazah']
            obj.perusahaan_kerja = post['perusahaan_kerja']
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