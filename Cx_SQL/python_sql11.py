import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()
s = """create table newbook2 as
select distinct title,price
from newbook"""
cur.execute(s)
mydb.commit()

sr = "select * from newbook2"
cur.execute(sr)
result = cur.fetchall()
for res in result:
              print(res)
