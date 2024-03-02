#read table items
import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()
s = "select * from newbook"
cur.execute(s)
result = cur.fetchall()
print(result)
