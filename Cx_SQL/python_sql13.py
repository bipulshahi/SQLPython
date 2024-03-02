#write a program to delete php_view and show remaining tables

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

#s = "drop table booknew2"
s = "drop view php_view"
cur.execute(s)
mydb.commit()

sr = "show tables"
cur.execute(sr)
result = cur.fetchall()
for res in result:
              print(res)
