from flask import Flask
from modules.ta_mahasiswa.Ta_mahasiswaRoute import app_ta_mahasiswa

app = Flask(__name__)
app.secret_key = '12345'

app.register_blueprint(app_ta_mahasiswa, url_prefix='/ta_mahasiswa')

if __name__ =='__main__':
    app.run(debug=True)