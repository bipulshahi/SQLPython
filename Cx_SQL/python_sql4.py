#insert table items
import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

s = "insert into newbook (bookid,title,price) values(%s,%s,%s)"
value = (2,"PHP",250)
cur.execute(s,value)
mydb.commit()
print('value added in table row')

