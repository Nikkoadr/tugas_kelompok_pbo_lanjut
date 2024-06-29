from flask import *
from modules.alumni_career_center.Alumni_career_centerModel import *
from modules.alumni_career_center.PelamarModel import *
from utils import login_required
from datetime import datetime

class Alumni_career_centerView:

    @staticmethod
    @login_required
    def index():
        data = Alumni_career_centerModel().get_data()
        return render_template('alumni_career_center_index.html',data=data)
    
    @staticmethod
    @login_required
    def create():
        return render_template('alumni_career_center_create.html')
    
    @staticmethod
    @login_required
    def store():
        obj = Alumni_career_centerModel()
        post = request.form
        obj.posisi = post['posisi']
        obj.perusahaan = post['perusahaan']
        obj.lokasi = post['lokasi']
        obj.deskripsi = post['deskripsi']
        obj.kualifikasi = post['kualifikasi']
        obj.tanggal_buka = post['tanggal_buka']
        obj.tanggal_tutup = post['tanggal_tutup']
        
        Alumni_career_centerModel().store(obj)
        flash('Data Berhasil Ditambahkan', 'success')
        return redirect('/alumni_career_center')
    
    @staticmethod
    @login_required
    def edit(id):
        obj = Alumni_career_centerModel().find(id)
        return render_template('alumni_career_center_edit.html',obj=obj)
    
    @staticmethod
    @login_required
    def update(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            post = request.form
            obj = Alumni_career_centerModel()
            obj.posisi = post['posisi']
            obj.perusahaan = post['perusahaan']
            obj.lokasi = post['lokasi']
            obj.deskripsi = post['deskripsi']
            obj.kualifikasi = post['kualifikasi']
            obj.tanggal_buka = post['tanggal_buka']
            obj.tanggal_tutup = post['tanggal_tutup']
            
            Alumni_career_centerModel().update(id, obj)
            flash('Data Berhasil Diperbaharui', 'success')
            return redirect('/alumni_career_center')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    @login_required
    def delete(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            Alumni_career_centerModel().delete(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/alumni_career_center')
        else: 
            return redirect(request.referrer)

    @staticmethod
    @login_required
    def data_pelamar():
        data = Alumni_career_centerModel().get_pelamar()
        return render_template('alumni_career_center_pelamar.html',data=data)

    @staticmethod
    @login_required
    def edit_data_pelamar(id):
        data = Alumni_career_centerModel().cari_pelamar(id)
        return render_template('alumni_career_center_edit_pelamar.html',data=data)

    @staticmethod
    @login_required
    def update_data_pelamar(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            post = request.form
            obj = Alumni_career_centerModel()
            obj.nama = post['nama']
            obj.email = post['email']
            obj.no_hp = post['no_hp']
            obj.tanggal_melamar = post['tanggal_melamar']
            obj.status = post['status']
            
            Alumni_career_centerModel().update_data_pelamar(id, obj)
            flash('Data Berhasil Diperbaharui', 'success')
            return redirect('/alumni_career_center/data_pelamar')
        else:
            return redirect(request.referrer)

    @staticmethod
    @login_required
    def hapus_data_pelamar(id):
        data = Alumni_career_centerModel().find(id)
        if data:
            Alumni_career_centerModel().delete_data_pelamar(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/alumni_career_center/data_pelamar')
        else: 
            return redirect(request.referrer)

    @staticmethod
    def daftar():
        data =  Alumni_career_centerModel().get_data()
        return render_template('alumni_career_center_daftar.html', data=data)

    @staticmethod
    def ambil_data_perusahaan():
        id_lowongan = request.form['id_lowongan']
        data = Alumni_career_centerModel().cari_perusahaan(id_lowongan)
        return render_template('alumni_career_center_form_daftar.html', data=data, id_lowongan=id_lowongan)

    @staticmethod
    def tambah_data_pelamar():
        obj = PelamarModel()
        form = request.form
        obj.nama = form['nama']
        obj.email = form['email']
        obj.no_hp = form['no_hp']
        obj.id_lowongan = form['id_lowongan']
        obj.tanggal_melamar = datetime.now()
        
        PelamarModel().store(obj)
        flash('Data Berhasil Ditambahkan', 'success')
        return redirect('/')
