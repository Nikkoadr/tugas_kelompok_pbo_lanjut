from core.CoreModel import CoreModel
from connection import get_db

class Publikasi_dosenModel(CoreModel):
    def __init__(self):
        self.table_name = "publikasi_dosen"
        self.table_id = "id_publikasi_dosen"