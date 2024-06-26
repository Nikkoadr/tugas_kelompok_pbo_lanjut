from core.CoreModel import CoreModel
from connection import get_db

class Manajemen_wisudaModel(CoreModel):
    def __init__(self):
        self.table_name = "wisuda"
        self.table_id = "id_wisuda"

    def get_nama(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
            SELECT alumni.id_lulus, alumni.tgl_yudisium, alumni.no_ijazah, alumni.judul_skripsi, 
                alumni.ipk_lulus, alumni.id_wisuda, alumni.id_mahasiswa, alumni.bidang_kerja, 
                alumni.perusahaan_kerja, user.nama_awal, user.nama_akhir, wisuda.tgl_wisuda
            FROM alumni
            JOIN mahasiswa ON alumni.id_mahasiswa = mahasiswa.id_mahasiswa
            JOIN user ON mahasiswa.id_user = user.id_user
            JOIN wisuda ON alumni.id_wisuda = wisuda.id_wisuda;
            """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result