#Add a new column

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()

s = "update newbook set skuid=2 where title = 'PHP'"
#s = """insert into newbook(skuid,title,price,sales,quantity) values(8,'IOT',360.0,720.0,2)"""
#s = "update newbook set skuid=1"
#s = "alter table newbook drop column bookid"
#s = "alter table newbook add column skuid INT first"
#s = "alter table newbook add column sales float(5,2) after price"
#s = "alter table newbook add column quantity integer(4)"

cur.execute(s)
mydb.commit()

cur.execute("select * from newbook")
for x in cur:
              print(x)
cur.close()
mydb.close()
