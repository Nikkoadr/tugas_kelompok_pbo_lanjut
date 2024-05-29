from core.CoreModel import CoreModel
from connection import get_db

class Alumni_career_centerModel(CoreModel):
    def __init__(self):
        self.table_name = "alumni_"
        self.table_id = "id_lulus"
