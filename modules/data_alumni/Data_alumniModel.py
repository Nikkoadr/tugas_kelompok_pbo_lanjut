from core.CoreModel import CoreModel
from connection import get_db

class Data_alumniModel(CoreModel):
    def __init__(self):
        self.table_name = "alumni"
        self.table_id = "id_lulus"

    def get_nama(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        alumni.id_alumni,
                        alumni.judul_skripsi, 
                        alumni.ipk_lulus,
                        alumni.id_wisuda,
                        alumni.id_mahasiswa,
                        alumni.no_ijazah,
                        alumni.pekerjaan, 
                        alumni.no_hp,
                        user.nama_awal,
                        user.nama_akhir,
                        wisuda.tgl_wisuda
                    FROM 
                        alumni
                    JOIN
                        mahasiswa ON alumni.id_mahasiswa = mahasiswa.id_mahasiswa
                    JOIN 
                        user ON mahasiswa.id_user = user.id_user
                    JOIN
                        wisuda ON alumni.id_wisuda = wisuda.id_wisuda;
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result
    
    def wisuda(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT 
                        wisuda.id_wisuda,
                        wisuda.tgl_wisuda
                    FROM 
                        wisuda
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result

    def cari_wisuda(self, id):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT 
                        wisuda.id_wisuda,
                        wisuda.tgl_wisuda
                    FROM 
                        wisuda
                    WHERE
                        wisuda.id_wisuda = %s;
                """
        cursor.execute(query, (id,))
        result = cursor.fetchone()
        cursor.close()
        connection.close()
        return result

    def mahasiswa(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT 
                        mahasiswa.id_mahasiswa, 
                        mahasiswa.id_progdi, 
                        user.nama_awal, 
                        user.nama_akhir,
                        program_studi.progdi
                    FROM 
                        mahasiswa
                    JOIN 
                        user ON mahasiswa.id_user = user.id_user
                    JOIN 
                        program_studi ON mahasiswa.id_progdi = program_studi.id_progdi;
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result

    def cari_mahasiswa(self, id):
            connection = get_db()
            cursor = connection.cursor()
            query = """
                SELECT 
                    mahasiswa.id_mahasiswa,
                    user.nama_awal, 
                    user.nama_akhir
                FROM 
                    mahasiswa
                JOIN 
                    user ON mahasiswa.id_user = user.id_user
                WHERE 
                    mahasiswa.id_mahasiswa = %s;
            """
            cursor.execute(query, (id,))
            result = cursor.fetchone()
            cursor.close()
            connection.close()
            return result