from core.CoreModel import CoreModel
from connection import get_db

class LoginModel(CoreModel):
    def __init__(self):
        self.table_name = "user"
        self.table_id = "email"
        
    @staticmethod
    def login(email, password):
        connection = get_db()
        cursor = connection.cursor()
        
        user_query = "SELECT * FROM user WHERE email = %s LIMIT 1;"
        cursor.execute(user_query, (email,))
        user = cursor.fetchone()
        
        if user and user['password'] == password:
            mahasiswa_query = "SELECT id_mahasiswa FROM mahasiswa WHERE id_user = %s LIMIT 1;"
            cursor.execute(mahasiswa_query, (user['id_user'],))
            mahasiswa = cursor.fetchone()
            dosen_query = "SELECT id_dosen FROM dosen WHERE id_user = %s LIMIT 1;"
            cursor.execute(dosen_query, (user['id_user'],))
            dosen = cursor.fetchone()
            cursor.close()
            connection.close()
            
            return {
                'id_user': user['id_user'],
                'email': user['email'],
                'nama_awal': user['nama_awal'],
                'nama_akhir': user['nama_akhir'],
                'id_grup': user['id_grup'],
                'id_mahasiswa': mahasiswa['id_mahasiswa'] if mahasiswa else None,
                'id_dosen': dosen['id_dosen'] if dosen else None
            }
        
        cursor.close()
        connection.close()
        return None