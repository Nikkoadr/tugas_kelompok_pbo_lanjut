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
            query = "SELECT * FROM user WHERE email = %s LIMIT 1;"
            cursor.execute(query, (email,))
            user = cursor.fetchone()
            cursor.close()
            connection.close()
            if user and user['password'] == password:
                return {
                    'email': user['email'],
                    'nama_awal': user['nama_awal'],
                    'nama_akhir': user['nama_akhir'],
                    'id_grup': user['id_grup']
                }
            return None