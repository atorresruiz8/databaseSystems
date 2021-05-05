import sqlite3

db_connection = None # connection to the database, empty for now
db_name = "C:/Users/atorr/Desktop/CSE111/DBs/TPCH.db" # exact path to database

item = 100 # used to check which method the user would like to call

while item != 0:
	# Which method do you want to call?
	item = input("Enter 1 - Connect to Database, Enter 2 - Create a Table, Enter 3 - Input Data, Enter 4 - Run Query 1, Enter 5 - Run Query 2, Enter 6 - Run Query 3, Enter 7 - Run Query 4, Enter 8 - Run Query 5, Enter 9 - Run Query 6, Enter 10 - Disconnect from Database: ")

	if item == '1': # connect to the database
		try:
			db_connection = sqlite3.connect(db_name)

		except sqlite3.Error as err:
			print(err)
		db_cursor = db_connection.cursor()
	if item == '2': # create a table (if it doesnt exist) in the database
		db_cursor.execute("CREATE TABLE IF NOT EXISTS warehouse(w_warehousekey DECIMAL(3,0) NOT NULL, w_name CHAR(25) NOT NULL, w_supplierkey DECIMAL(2,0) NOT NULL, w_capacity DECIMAL(6,2) NOT NULL, w_address VARCHAR(40) NOT NULL, w_nationkey DECIMAL(2,0) NOT NULL)")
		db_connection.commit()
	if item == '3': # input data to a table in the database
		wKey = input("Warehouse Number: ")
		wName = input("Warehouse: ")
		sKey = input("Supplier: ")
		cap = input("Capacity: ")
		addr = input("Address: ")
		nation = input("Nation: ")
		db_cursor.execute("INSERT INTO warehouse(w_warehousekey, w_name, w_supplierkey, w_capacity, w_address, w_nationkey) VALUES (?,?,?,?,?,?)", [wKey,wName,sKey,cap,addr,nation])
		db_connection.commit()
	if item == '4': # run query 1
		db_cursor.execute("SELECT s_name, MIN(counter) FROM (SELECT s_name, COUNT(w_name) AS counter FROM supplier, warehouse WHERE s_suppkey = w_supplierkey GROUP BY s_name)")
		for row in db_cursor.fetchall():
			print(row)
	if item == '5': # run query 2
		db_cursor.execute("SELECT MAX(maxCap) FROM (SELECT MAX(w_capacity) AS maxCap FROM supplier, warehouse WHERE s_suppkey = w_supplierkey GROUP BY s_name)")
		for row in db_cursor.fetchall():
			print(row)
	if item == '6': # run query 3
		X = input("Capacity for a specific warehouse in EUROPE: ")
		db_cursor.execute("SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = 'EUROPE' AND w_capacity = ?", [X])
		for row in db_cursor.fetchall():
			print(row)
	if item == '7': # run query 4
		suppName = input("Supplier Name: ")
		temp = db_cursor.execute("SELECT w_capacity FROM supplier, warehouse WHERE s_suppkey = w_supplierkey AND s_name = ?", [suppName])
		temp2 = db_cursor.execute("SELECT ps_availqty FROM partsupp, supplier WHERE s_suppkey = ps_suppkey AND s_name = ?", [suppName])
		for row in db_cursor.fetchall():
			if (temp >= temp2):
				print("Fits")
			else:
				print("Doesn't Fit")
			print(row)
	if item == '8': # run query 5
		nation = input("Nation Name: ")
		db_cursor.execute("SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = ? ORDER BY w_capacity DESC", [nation])
		for row in db_cursor.fetchall():
			print(row)
	if item == '9': # run query 6
		sup1 = input("Who is the first supplier, the one that will be replaced?:")
		sup2 = input("Who is the supplier that will replace the first?:")
		db_cursor.execute("UPDATE warehouse SET w_supplierkey = ? WHERE w_supplierkey = ?", [sup1,sup2])
		for row in db_cursor.fetchall():
			print(row)
	if item == '10': # disconnect from the database
		db_cursor.close()
		db_connection.close()

###### Always close cursor and connection ######
db_cursor.close()
db_connection.close()