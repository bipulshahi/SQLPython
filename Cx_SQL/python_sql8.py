#Update table items

import mysql.connector
mydb = mysql.connector.connect(host='localhost',
                               user='root',password='725@Mysql',
                               database='db3')
cur = mydb.cursor()
#s = "update newbook set price = price+10"
s = "update newbook set price = price+10 where price>300"
cur.execute(s)
mydb.commit()
print('price value is updated')
