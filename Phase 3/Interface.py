import sqlite3

db_connection = None # connection to the database, empty for now
db_name = "C:/Users/atorr/Desktop/CSE111/Project/Security (Project).db" # exact path to database

item = 100 # used to check which method the user would like to call
table = 100 # used to know which table the user would like to input values into

while item != 0:
	# Which method do you want to call?
	item = input("Enter 1 - Connect to Database, Enter 2 - Create a Table, Enter 3 - Input Data, Enter 4 - Run Query 1, Enter 5 - Run Query 2, Enter 6 - Insert a test tuple, Enter 7 - Update tuples, Enter 8 - Delete a tuple, Enter 9 - Create your own query, Enter 10 - Disconnect from Database: ")

	if item == '1': # connect to the database
		try:
			db_connection = sqlite3.connect(db_name)
		except sqlite3.Error as err:
			print(err)
		db_cursor = db_connection.cursor()
	if item == '2': # create a table (if it doesnt exist) in the database. This table will store phone numbers, the carrier (or service provider), whether or not the person has a service app for their secruity system, date of last use, and where it was during the incident
		db_cursor.execute("CREATE TABLE IF NOT EXISTS phones(p_number INTEGER(10) NOT NULL, p_carrier STRING(25) NOT NULL, p_serviceApp CHAR(5) NOT NULL, p_lastDate STRING(25) NOT NULL, p_location STRING(40) NOT NULL)")
		db_connection.commit()
	if item == '3': # input data to a table in the database
		table = input("Which table would you like to input into? Alarm = 1, Camera = 2, Equipment = 3, Guard = 4, Incident = 5, Location = 6, User Created Table = 7: ")
		if table == '1': # Insert a tuple into the alarm table
			aMod = input("Alarm Model, INT: ")
			aType = input("Alarm Type, STRING: ")
			aPrice = input("Alarm Price, INT: ")
			aSound = input("Alarm Sound, STRING: ")
			aRange = input("Alarm Range, INT: ")
			db_cursor.execute("INSERT INTO alarm(a_model, a_type, a_price, a_sound, a_range) VALUES(?, ?, ?, ?, ?)", [aMod,aType,aPrice,aSound,aRange])
			db_connection.commit()
		if table == '2': # Insert a tuple into the camera table
			cMod = input("Camera Model, INT: ")
			cStor = input("Camera Storage, INT: ")
			cLens = input("Camera Lens, STRING: ")
			cPrice = input("Camera Price, INT: ")
			cRecord = input("Camera Recording Status, STRING: ")
			db_cursor.execute("INSERT INTO camera(c_model, c_storage, c_lens, c_price, c_recordingStatus) VALUES(?, ?, ?, ?, ?)", [cMod,cStor,cLens,cPrice,cRecord])
			db_connection.commit()
		if table == '3': # Insert a tuple into the equipment table
			ePrice = input("Equipment Price, INT: ")
			eAlarmMod = input("Equipment Alarm Model, INT: ")
			eCamMod = input("Equipment Camera Model, INT: ")
			eVehicle = input("Equipment Vehicles, STRING: ")
			eHandcuffs = input("Equipment Handcuffs, CHAR: ")
			eRadio = input("Equipment Radio, CHAR: ")
			eDefenseWep = input("Equipment Defense Weapons, STRING: ")
			db_cursor.execute("INSERT INTO equipment(e_price, e_alarmMod, e_camMod, e_vehicle, e_handcuffs, e_radio, e_defenseWep) VALUES(?, ?, ?, ?, ?, ?, ?)", [ePrice,eAlarmMod,eCamMod,eVehicle,eHandcuffs,eRadio,eDefenseWep])
			db_connection.commit()
		if table == '4': # Insert a tuple into the guard table
			gSalary = input("Guards Salary, INT: ")
			gArmedStat = input("Guards Armed Status, CHAR: ")
			gArrivalStat = input("Guards Arrival Status, CHAR: ")
			gDefenseWep = input("Guards Defense Weapons, STRING: ")
			gBadge = input("Guards Badge Number, INT: ")
			db_cursor.execute("INSERT INTO guard(g_salary, g_armedStatus, g_arrivalStatus, g_defenseWep, g_badgeNum) VALUES(?, ?, ?, ?, ?)", [gSalary,gArmedStat,gArrivalStat,gDefenseWep,gBadge])
			db_connection.commit()
		if table == '5': # Insert a tuple into the incident table
			iAlarmMod = input("Incident Alarm Model, INT: ")
			iCamMod = input("Incident Camera Model, INT: ")
			iDate = input("Incident Date, CHAR: ")
			iCulprit = input("Incident Culprit's Name, STRING: ")
			iEquipment = input("Incident Equipment, VARCHAR: ")
			iAddress = input("Incident Address, CHAR: ")
			iBadge = input("Incident Guard's Badge Number, INT: ")
			db_cursor.execute("INSERT INTO incident(i_alarmMod, i_camMod, i_date, i_culpritName, i_equipment, i_address, i_badgeNum) VALUES(?, ?, ?, ?, ?, ?, ?)", [iAlarmMod,iCamMod,iDate,iCulprit,iEquipment,iAddress,iBadge])
			db_connection.commit()
		if table == '6': # Insert a tuple into the location table
			lDate = input("Location Date, VARCHAR: ")
			lCamMod = input("Location Camera Model, INT: ")
			lAddress = input("Location Address, VARCHAR: ")
			lBadge = input("Location Guard's Badge Number, INT: ")
			lAlarmMod = input("Location Alarm Model, INT: ")
			lPossession = input("Location Possessions of the Owners, CHAR: ")
			db_cursor.execute("INSERT INTO location(l_date, l_camMod, l_address, l_badgeNum, l_alarmMod, l_possession) VALUES(?, ?, ?, ?, ?, ?)", [lDate,lCamMod,lAddress,lBadge,lAlarmMod,lPossession])
			db_connection.commit()
		if table == '7': # Insert a tuple into the user created table. Will do nothing if the table does not exist.
			pNumber = input("Phone Number, INT: ")
			pCarrier = input("Phone Carrier/Service Provider, STRING: ")
			pApp = input("Does the Phone have an app for the security service provider? (Y or N), CHAR: ")
			pLastDate = input("Last date the Phone was used?, STRING: ")
			pLocation = input("Phone's Location During Incident, STRING: ")
			db_cursor.execute("INSERT INTO phones(p_number, p_carrier, p_serviceApp, p_lastDate, p_location) VALUES(?, ?, ?, ?, ?)", [pNumber,pCarrier,pApp,pLastDate,pLocation])
			db_connection.commit()
	if item == '4': # run query 1, a simple query
		db_cursor.execute("SELECT a_price, i_equipment FROM incident, alarm WHERE i_alarmMod = a_model")
		for row in db_cursor.fetchall():
			print(row)
	if item == '5': # run query 2, a simple query
		db_cursor.execute("SELECT COUNT(DISTINCT a_model) FROM alarm")
		for row in db_cursor.fetchall():
			print(row)
	if item == '6': # This statement will insert a specific tuple into the incident table
		db_cursor.execute("INSERT INTO incident(i_alarmMod, i_camMod, i_date, i_culpritName, i_equipment, i_address, i_badgeNum) VALUES(100000, 0000001, '10-01-2019', 'Greg Markson', 'Police baton', '10 San Jose', 123445);")
		db_connection.commit() # commit the change
		print("Inserted!") # Let the user know the tuple was inserted by printing a message to the screen
	if item == '7': # Let the user update any tuple in the database by telling them how to write an update statement. 
		query = input("Update something in the database? Write in the form of 'UPDATE [table] SET [attribute you want to change, and what it'll now be] WHERE [conditions]: ")
		db_cursor.execute(query)
		db_connection.commit()
		print("Updated!") # Let the user know the tuple was updated by printing a message to the screen
	if item == '8': # A statement that deletes something from the database. This describes to the user how to write their own delete statement, then runs said statement. It returns nothing and deletes the specified tuple from the database
		query = input("Delete something from the database? Write in the form of 'DELETE FROM [table] WHERE [specific condition to search for an delete from applicable tuples]: ")
		db_cursor.execute(query)
		db_connection.commit()
		print("Deleted!") # Let the user know the tuple was successfully deleted by printing a message to the screen
	if item == '9': # This allows the user to create their own query, describes how to write one, and then runs said query on the database. It returns the results of the user generated query.
		query = input("Create your own query! Write in the form of 'SELECT [attribute you want to use] FROM [table looking in] WHERE [conditions to narrow down search]. Can also use GROUP BY [attribute] or ORDER BY [attribute] DESC (descending)/ASEC (ascending) or HAVING [attribute]: ")
		db_cursor.execute(query) # Execute user made query.
		for row in db_cursor.fetchall():
			print(row)
	if item == '10': # disconnect from the database
		db_cursor.close()
		db_connection.close()

###### Always close cursor and connection ######
db_cursor.close()
db_connection.close()