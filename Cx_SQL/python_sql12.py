#create a view with all PHP titles from newbook

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

s = """create view PHP_view as select * from newbook
where title = 'PHP'"""
cur.execute(s)
mydb.commit()

sr = "select * from PHP_view"
cur.execute(sr)
result = cur.fetchall()
for res in result:
              print(res)
