from core.CoreModel import CoreModel
from connection import get_db

class Tugas_akhir_mahasiswaModel(CoreModel):
    def __init__(self):
        self.table_name = "tugas_akhir"
        self.table_id = "id_tugas_akhir"