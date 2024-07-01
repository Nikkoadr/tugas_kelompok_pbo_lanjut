from core.CoreModel import CoreModel
from connection import get_db

class Publikasi_dosenModel(CoreModel):
    def __init__(self):
        self.table_name = "publikasi"
        self.table_id = "id_publikasi"

    def publikasi_dosen_all(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        publikasi.*,
                        user.nama_awal,
                        user.nama_akhir
                    FROM
                        publikasi
                    JOIN
                        dosen ON publikasi.id_dosen = dosen.id_dosen
                    JOIN
                        user ON dosen.id_dosen = user.id_user
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result

    def get_dosen(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        dosen.id_dosen,
                        dosen.nidn,
                        user.nama_awal,
                        user.nama_akhir
                    FROM
                        dosen
                    JOIN
                        user ON dosen.id_dosen = user.id_user
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result