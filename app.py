from flask import Flask, request, render_template, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

mysql = MySQL()
app = Flask(__name__)
CORS(app)

# Your MySQL configuration goes here
app.config['MYSQL_USER'] = 'ian'
app.config['MYSQL_PASSWORD'] = 'secret'
app.config['MYSQL_DB'] = 'student'
app.config['MYSQL_HOST'] = '34.147.249.208'
mysql.init_app(app)

def execute_query(query, args=()):
    try:
        cur = mysql.connection.cursor()
        cur.execute(query, args)
        mysql.connection.commit()
        return {'Result': 'Success'}
    except Exception as e:
        return {'Result': 'Error', 'Message': str(e)}

@app.route("/add", methods=['POST'])
def add():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    query = 'INSERT INTO students(studentName, email) VALUES(%s, %s);'
    return jsonify(execute_query(query, (name, email)))

@app.route("/update", methods=['PUT'])
def update():
    data = request.get_json()
    student_id = data.get('id')
    name = data.get('name')
    email = data.get('email')
    query = 'UPDATE students SET studentName = %s, email = %s WHERE studentID = %s;'
    return jsonify(execute_query(query, (name, email, student_id)))

@app.route("/delete", methods=['DELETE'])
def delete():
    data = request.get_json()
    name = data.get('name')
    query = 'DELETE FROM students WHERE studentName = %s;'
    return jsonify(execute_query(query, (name,)))

@app.route("/default")
def read():
    try:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM students')
        rows = cur.fetchall()
        students = [{'ID': row[0], 'Name': row[1], 'Email': row[2]} for row in rows]
        return jsonify({'Results': students, 'Count': len(students)})
    except Exception as e:
        return jsonify({'Result': 'Error', 'Message': str(e)})

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
