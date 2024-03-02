#insert table items
import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

s = "insert into newbook (bookid,title,price) values(%s,%s,%s)"
value = [(3,"PHP",250),(4,"HTML",230),(5,"Java",400)]
cur.executemany(s,value)
mydb.commit()
print('multiple values added in table row')

