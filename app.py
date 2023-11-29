from flask import Flask, request, render_template
from flask_mysqldb import MySQL
from flask_cors import CORS
import json

mysql = MySQL()
app = Flask(__name__)
CORS(app)

app.config['MYSQL_USER'] = 'ian'
app.config['MYSQL_PASSWORD'] = 'secret'
app.config['MYSQL_DB'] = 'student'
app.config['MYSQL_HOST'] = '34.147.249.208'
mysql.init_app(app)

def execute_query(query, params=None):
    try:
        cur = mysql.connection.cursor()
        if params:
            cur.execute(query, params)
        else:
            cur.execute(query)
        mysql.connection.commit()
        return True
    except Exception as e:
        print("Error:", e)
        return False

@app.route("/add", methods=['POST'])  
def add():
    name = request.json.get('name')
    email = request.json.get('email')
    query = "INSERT INTO students (name, email) VALUES (%s, %s)"
    success = execute_query(query, (name, email))

    if success:
        return '{"Result": "Success"}'
    else:
        return '{"Result": "Error"}'

@app.route("/update", methods=['PUT'])  
def update():
    id = int(request.form.get('id'))
    name = request.json.get('name')
    email = request.json.get('email')
    query = "UPDATE students SET name = %s, email = %s id = %s"
    success = execute_query(query, (name, email, id))

    if success:
        return '{"Result": "Success"}'
    else:
        return '{"Result": "Error"}'

@app.route("/delete", methods=['DELETE'])  
def delete():
    name = request.args.get('deleteName')
    query = "DELETE FROM students WHERE name = %s"
    success = execute_query(query, (name,))

    if success:
        return '{"Result": "Success"}'
    else:
        return '{"Result": "Error"}'

@app.route("/default")  
def read():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM students")
        rv = cur.fetchall()
        Results = []
        for row in rv:
            Result = {}
            Result['Name'] = row[0].replace('\n', ' ')
            Result['Email'] = row[1]
            Result['ID'] = row[2]
            Results.append(Result)
        response = {'Results': Results, 'count': len(Results)}
        ret = app.response_class(
            response=json.dumps(response),
            status=200,
            mimetype='application/json'
        )
        return ret
    except Exception as e:
        return '{"Result": "Error", "Message": "' + str(e) + '"}'
    
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080')
