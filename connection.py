import pymysql
import pymysql.cursors
def get_db():
    # connection = pymysql.connect(
    #     host='103.156.17.180',
    #     user='dosq28_nikko',
    #     password='4Av2QicK4nNk',
    #     database='dosq28_pbo2',
    #     cursorclass=pymysql.cursors.DictCursor
    # )
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        database='tugas_kelompok_pbo-lanjut',
        cursorclass=pymysql.cursors.DictCursor
    )
    return connection
