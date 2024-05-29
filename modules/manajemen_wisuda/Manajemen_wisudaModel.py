from core.CoreModel import CoreModel
from connection import get_db

class Manajemen_wisudaModel(CoreModel):
    def __init__(self):
        self.table_name = "manajemen_wisuda"
        self.table_id = "id_manajemen_wisuda"