import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

s = "insert into newbook (bookid,title,price) values(%s,%s,%s)"
books = [(3,"PHP",260),(3,"PHP",260)]
cur.executemany(s,books)
mydb.commit()
print('PHP rows values are added')
