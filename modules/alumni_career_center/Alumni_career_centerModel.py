from core.CoreModel import CoreModel
from connection import get_db

class Alumni_career_centerModel(CoreModel):
    def __init__(self):
        self.table_name = "data_loker"
        self.table_id = "id_loker"

    def get_data(self):
        connection = get_db()
        cursor = connection.cursor()
        query = """
                    SELECT
                        data_loker.id_loker,
                        data_loker.loker,
                        data_loker.nama_perusahaan,
                        data_loker.tgl_loker,
                        data_loker.ket_loker,
                        data_loker.jenis_loker,
                        wisuda.tgl_wisuda
                    FROM 
                        data_loker
                    JOIN
                        wisuda ON data_loker.id_wisuda = wisuda.id_wisuda;
                """
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        connection.close()
        return result