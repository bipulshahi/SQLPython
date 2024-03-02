#Create a database

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql')
cur = mydb.cursor()
cur.execute("create DATABASE db3")
print('db3 database created')
