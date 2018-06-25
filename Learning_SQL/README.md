# My Personal Notes ~ Learning SQL ~

## Tips and Tricks

Some of the things I find useful in my learning process are summarized here.

## Theoretical Bulletpoints

- a Database is a collection of data
- Database != Database Management System (DBMS)
	- Some DBMS are : PostgreSQL, MySQL, Oracle Database
- in use Database = structured set of computerized data with an accessible interface
- DBMS are valuable because of the unique features they offer
- All data is stored in Tables (columns and rows)


## Data Types


| Numeric Types   | String Types 		 | Data Types 	|
| --------------- | ---------------------------- | ---------- 	| 
| INT		  | CHAR 	 		 | DATA 	|
| SMALLINT 	  | VARCHAR 	 		 | DATETIME 	|
| TINYINT 	  | BINARY 	 		 | TIMESTAMP 	|
| MEDIUMINT 	  | VARBINARY 	 		 | TIME 	|
| BIGINT 	  | BLOB 	 		 | YEAR 	|
| DECIMAL 	  | TINYBLOB 	 		 | - 		|
| NUMERIC 	  | MEDIUMBLOB 	 		 | - 		|
| FLOAT  	  | LONGBLOB 	 		 | - 		|
| DOUBLE 	  | TINY-, MEDIUM-, LONGTEXT	 | - 		|
| BIT 		  | ENUM 		    	 | - 		|



## Useful Commands

### For Cloud9

**Start/stop MySQL**
```
mysql-ctl start;
mysql-ctl stop;

```

**Start/stop MySQL Interactive Shell**

```
mysql-ctl cli;
exit;

```


### General Commands

**Show all databases** 

```
SHOW DATABASES; 
```

**Create a database**

```
CREATE DATABASE <database_name>;
```

**Delete a database (drop a DB)**
```
DROP DATABASE <database_name>;
```

**Use a Database (for CRUD commands = Create, Read, Update, Delete )**
```
USE <database_name>;
```

**Check the name of the current database (in use)**
```
SELECT database();
```

### CRUD summary ###
**CREATE**
``` 
CREATE DATABASE <database_name>; # Creates a database
CREATE TABLE <table_name>; # Creates a table in the current database 
```

**READ**
```
SELECT * FROM <table_name>; # retrieves all columns from the chosen table
SELECT <field1>, <field2>,...,<fieldN> FROM <table_name>; # retrieves chosen columns from the chosen table
```

**Insert DATA into a table**
``` 
INSERT INTO <table_name> (chosen_column_name1, chosen_column_name2...chosen_column_nameN) VALUES (value_for_column1, value_for_column2...value_for_columnN);
```

Multiple entries can be inserted with only one comand at once, separated by coma ' , '

_**Example**_

```
CREATE DATABASE test_db; # Creates a database called test_db
USE test_db; # Sets test_db as current database
CREATE TABLE example_table (value INT, name VARCHAR (50) DEFAULT "NO_NAME"); # Creates a table in test_db
INSERT INTO example_table(value, name) VALUES (25, 'Buck'),(13, 'Deer'); #Inserts two entries in the example_table
```

**Set a MANDATORY field (not NULL)**
``` 
CREATE TABLE test_table1 (field1 <data_type> NOT NULL)
```

**Set a DEFAULT value for a table field**
``` 
CREATE TABLE test_table2 (field1 <data_type>, field2 <data_type> DEFAULT <default_value_of_same_data_type_as_field2> );
```

**Set a PRIMARY KEY**
```
CREATE TABLE test_table3( field1 <data_type>, field2 <data_type> , PRIMARY KEY(field_number_of_choice));
```
_**ALSO VALID**_

```
CREATE TABLE test_table4( field1 <data_type> PRIMARY KEY, field2 <data_type>  );
```
**Create a table with an ID Field (with AUTO_INCREMENT)**
```
CREATE TABLE test_table5 (field1 INT AUTO_INCREMENT PRIMARY KEY, field2 <data_type> );
```
