#Delete table items


import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()
s = "delete from newbook where title='JAVA'"
cur.execute(s)
mydb.commit()
print('Java Sample deleted')
