from flask import Flask, render_template, flash, redirect, url_for, session, request, logging, jsonify, make_response
#from data import Articles
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps
from flask_cors import CORS
import json
import pliku

import jwt
import datetime

app = Flask(__name__)

app.config['SECRET_KEY'] ='thisisthesecretkey'

# Config MySQL
app.config['MYSQL_HOST'] = 'us-cdbr-iron-east-02.cleardb.net'
app.config['MYSQL_USER'] = 'b44f67710baaf4'
app.config['MYSQL_PASSWORD'] = '203a145a'
app.config['MYSQL_DB'] = 'heroku_29fdc3ecbc4ef36'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)

CORS(app)

@app.route('/')
def hello():
    return ("APLIKASI ENCRYPT DAN DECRYPT DATA")

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.args.get('token') #http://127.0.0.1:5000/route?token=alsberJkaekfm233545ur

        if not token:
            return jsonify({'message' :'Token is missing!'}), 403
         
        try:
            data = jwt.decode(token, app.config['SECRET_KEY'])
        except:
            return jsonify({'message ' : 'Token is invalid'}), 403 

        return f(*args, **kwargs)
        
    return decorated

@app.route('/login')
def login():
    auth = request.authorization

    if auth and auth.password == 'ircmaju':
        token = jwt.encode({'user' : auth.username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=15)}, app.config['SECRET_KEY'])

        return jsonify({'token' : token.decode('UTF-8')})

    return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Login required!"'})

@app.route('/pengguna', methods=['GET'])
def get_android():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM kunciku")
    rv = cur.fetchall()
    return jsonify(result=rv)

    cur.close()

@app.route('/enkripsi',methods=['POST', 'GET'])
@token_required
def tes():
    cur = mysql.connection.cursor()

    if request.method=='GET':

      # Read a single record
     result = cur.execute("SELECT * FROM kunciku")
     coba = cur.fetchall()

     mysql.connection.commit()

     return pliku.AESCipher('secret').encrypt(str(coba)).decode('utf-8')

     cur.close()

    else:
      return "error"

@app.route('/dekripsi',methods=['POST', 'GET'])
@token_required
def decrypt():
    if request.method=='POST':
        cte = request.form['cte']
        return pliku.AESCipher('secret').decrypt(cte).decode('utf-8')
    else:
      return "error"

if __name__ == '__main__':
    app.run(debug=True, port=int("80"))
