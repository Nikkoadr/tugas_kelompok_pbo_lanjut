from flask import *
from modules.manajemen_wisuda.Manajemen_wisudaModel import *
from modules.manajemen_wisuda.Peserta_wisudaModel import *

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
        flash('Data Berhasil Ditambahkan', 'success')
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
            obj.wisuda = post['wisuda']
            obj.tgl_wisuda = post['tgl_wisuda']
            Manajemen_wisudaModel().update(id, obj)
            flash('Data Berhasil Diperbarui', 'success')
            return redirect('/manajemen_wisuda')
        else:
            return redirect(request.referrer)
        
    @staticmethod
    def delete(id):
        data = Manajemen_wisudaModel().find(id)
        if data:
            Manajemen_wisudaModel().delete(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/manajemen_wisuda')
        else: 
            return redirect(request.referrer)

    @staticmethod
    def admin_pendaftar():
        data = Peserta_wisudaModel().get_pendaftar()
        return render_template('admin_pendaftar.html', data=data)

    @staticmethod
    def edit_peserta(id):
        data = Peserta_wisudaModel().find(id)
        return render_template('edit_pendaftar.html', data=data)

    @staticmethod
    def update_peserta(id):
        data = Peserta_wisudaModel().find(id)
        if data:
            form = request.form
            obj = Peserta_wisudaModel()
            obj.no_urut = form['no_urut']
            Peserta_wisudaModel().update(id,obj)
        return redirect('/manajemen_wisuda/admin_pendaftar')

    @staticmethod
    def delete_peserta(id):
        data = Peserta_wisudaModel().find(id)
        if data:
            Peserta_wisudaModel().delete(id)
            flash('Data Berhasil Dihapus', 'success')
            return redirect ('/manajemen_wisuda/admin_pendaftar')
        else: 
            return redirect(request.referrer)

    @staticmethod
    def daftar_wisuda ():
        data = Manajemen_wisudaModel().all()
        return render_template('cari_wisuda_mahasiswa.html', data=data)

    @staticmethod
    def pilih_wisuda():
        id_wisuda = request.form['id_wisuda']
        id_mahasiswa = request.form['id_mahasiswa']
        return render_template('daftar_wisuda.html', id_wisuda=id_wisuda, id_mahasiswa=id_mahasiswa)

    @staticmethod
    def tambah_peserta_wisuda():
        obj = Peserta_wisudaModel()
        post = request.form
        obj.id_wisuda = post['id_wisuda']
        obj.id_mahasiswa = post['id_mahasiswa']
        obj.no_urut = post['no_urut']
        Peserta_wisudaModel().store(obj)
        
        id_wisuda = post['id_wisuda']
        id_mahasiswa = post['id_mahasiswa']
        detail = Peserta_wisudaModel().cari_wisuda(id_wisuda, id_mahasiswa)
        return render_template('undangan_wisuda_mahasiswa.html', obj=obj, detail=detail)