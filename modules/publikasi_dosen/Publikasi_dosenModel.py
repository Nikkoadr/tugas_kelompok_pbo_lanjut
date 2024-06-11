from core.CoreModel import CoreModel
from connection import get_db

class Publikasi_dosenModel(CoreModel):
    def __init__(self):
        self.table_name = "publikasi_dosen"
        self.table_id = "id_publikasi_dosen"

    def cari_nama():
        connection = get_db()
        cursor = connection.cursor()
        query = """
            SELECT 
                nama_dosen
            FROM 
                publikasi_dosen 
            WHERE 
            id_publikasi_dosen = %s
        """
        cursor.execute(query, (id_publikasi_dosen))
        result = cursor.fetchone()
        return result