from core.CoreModel import CoreModel
from connection import get_db

class PelamarModel(CoreModel):
    def __init__(self):
        self.table_name = "pelamar"
        self.table_id = "id_pelamar"