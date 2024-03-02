#Python code to establish a connection with mysql server to create a data base
import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql')
print(mydb.connection_id)
