#Create a data table in db3

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()
s = "create table newbook(bookid integer(4),title varchar(20),price float(5,2))"
cur.execute(s)
mydb.commit()
print('Data Table newbook is created in db2 to store data')
