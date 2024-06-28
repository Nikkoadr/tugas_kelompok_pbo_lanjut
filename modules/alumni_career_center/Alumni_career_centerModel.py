from core.CoreModel import CoreModel
from connection import get_db

class Alumni_career_centerModel(CoreModel):
    def __init__(self):
        self.table_name = "lowongan_kerja"
        self.table_id = "id_lowongan"

    def get_data(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        lowongan_kerja.id_lowongan,
                        lowongan_kerja.posisi,
                        lowongan_kerja.perusahaan,
                        lowongan_kerja.lokasi,
                        lowongan_kerja.deskripsi,
                        lowongan_kerja.kualifikasi,
                        lowongan_kerja.tanggal_buka,
                        lowongan_kerja.tanggal_tutup
                    FROM 
                        lowongan_kerja
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result

    def get_pelamar(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        pelamar.id_pelamar,
                        pelamar.nama,
                        pelamar.email,
                        pelamar.no_hp,
                        lowongan_kerja.perusahaan,
                        pelamar.tanggal_melamar,
                        pelamar.status
                    FROM 
                        pelamar
                    JOIN
                        lowongan_kerja ON pelamar.id_lowongan = lowongan_kerja.id_lowongan
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result

    def cari_pelamar(self,id):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        pelamar.id_pelamar,
                        pelamar.nama,
                        pelamar.email,
                        pelamar.no_hp,
                        pelamar.tanggal_melamar,
                        pelamar.status
                    FROM 
                        pelamar
                    WHERE
                        pelamar.id_pelamar = %s;
                """
        cursor.execute(query, (id,))
        result = cursor.fetchone()
        cursor.close()
        connection.close()
        return result

    def update_data_pelamar(self, id, obj):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    UPDATE pelamar
                    SET
                        nama = %s,
                        email = %s,
                        no_hp = %s,
                        tanggal_melamar = %s,
                        status = %s
                    WHERE
                        id_pelamar = %s;
                """
        cursor.execute(query, (obj.nama, obj.email, obj.no_hp, obj.tanggal_melamar, obj.status, id))
        connection.commit()
        cursor.close()
        connection.close()