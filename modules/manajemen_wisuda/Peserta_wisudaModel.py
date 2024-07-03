from core.CoreModel import CoreModel
from connection import get_db

class Peserta_wisudaModel(CoreModel):
    def __init__(self):
        self.table_name = "peserta_wisuda"
        self.table_id = "id_peserta"

    def get_pendaftar(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                SELECT
                    peserta_wisuda.id_peserta,
                    user.nama_awal,
                    user.nama_akhir,
                    wisuda.tgl_wisuda,
                    peserta_wisuda.no_urut
                FROM
                    peserta_wisuda
                JOIN
                    mahasiswa ON peserta_wisuda.id_mahasiswa = mahasiswa.id_mahasiswa
                JOIN 
                    user ON mahasiswa.id_user = user.id_user
                JOIN 
                    wisuda ON peserta_wisuda.id_wisuda = wisuda.id_wisuda;
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result
