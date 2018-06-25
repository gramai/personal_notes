# ~ Learning SQL ~

### Description
I love learning new things but I can't help forgetting some. This is why I do this short summaries in a 'cheatsheet' like manner, to be able to keep all important details in one place. 

# Contents 

| #   | Name                              | Programming Language    | Link                                           |
| --- | --------------------------------- | ----------------------- | ---------------------------------------------- |
| 1   | My first SQL problem              | SQL                     | [Github](./src/shirts_db.sql)                  |

## Tips and Tricks
Short tips and tricks that got the SQL work flowing (for me).

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

**Create a database **

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

**SQL Files**
- SQL files have the .sql extension
- SQL files can be run from within a SQL environment using the _source_ command

_**Example**_
```
source <file_name>.sql; -- This is valid only if the file exists in the working directory
source <path_to_file>/<file_name>.sql; 
```

## CRUD 
**CREATE**
``` 
CREATE DATABASE <database_name>; -- Creates a database
CREATE TABLE <table_name>; -- Creates a table in the current database 
```

**READ (SELECT)**
Retrieve columns _without condition_
```
SELECT * FROM <table_name>; -- retrieves all columns from the chosen table
SELECT <field1>, <field2>,...,<fieldN> FROM <table_name>; -- retrieves chosen columns from the chosen table
```
Retrieve columns _with contidion_
```
SELECT * FROM <table_name> WHERE <field_value> = value; -- <field_value> = value means that the value present in a certain field is equal to the given value
```
Retrieve specified column under _a different name (Alias)_
```
SELECT <column_name> as <ALIAS> from <table_name>;
```

Retrieve multiple columns and _concatenate_ them
```
SELECT CONCAT (<column_name1>, <column_name2>,...,<column_nameN>) FROM table_name; -- without separator
SELECT CONCAT (<column_name1>, 'text1', <column_name2>,'text2',...<column_nameN>) FROM table_name; -- with text between the contents of the columns
SELECT WS_CONCAT ('<chosen_separator>' , <column_name1>, <column_name2>,...,<column_nameN>) FROM table_name; 
```

Using _**SUBSTRING**_
```
SELECT SUBSTRING(<column_name>, start_indice_value, end_indice_value) FROM <table_name>; -- OBSERVATION: Indices start at 1
SELECT SUBSTRING(<column_name>, start_indice_value) FROM <table_name>; -- In this case, end_indice_value=string length

SELECT SUBSTRING(<column_name>, -start_indice_value) FROM <table_name>; 
-- -start_indice_value is < 0 -> start indice will have the value string_length - start_indice_value 
-- -> The substring will contain the characters (string_length - start_indice_value , string_length) 
```
Using _**REPLACE**_
Replaces chosen part of a string
```
SELECT REPLACE (string, pattern_to_replace, replace_string) FROM <table_name>; -- replaces all found patterns in the string
```

**UPDATE**
```
UPDATE <table_name> SET field=value_to_set WHERE <field_value> = value_to_update;
```

**DELETE**
```
DELETE FROM <table_name> WHERE <field_value> = value;
```

**Insert DATA into a table**
``` 
INSERT INTO <table_name> (<chosen_column_name1>, <chosen_column_name2>...<chosen_column_nameN>) VALUES (<value_for_column1>, <value_for_column2>...<value_for_columnN>);
```

Multiple entries can be inserted with only one comand at once, separated by comma ' , '

_**Example**_

```
CREATE DATABASE test_db; -- Creates a database called test_db
USE test_db; -- Sets test_db as current database
CREATE TABLE example_table (value INT, name VARCHAR (50) DEFAULT "NO_NAME"); -- Creates a table in test_db
INSERT INTO example_table(value, name) VALUES (25, 'Buck'),(13, 'Deer'); -- Inserts two entries in the example_table
```

**Set a MANDATORY field (not NULL)**
``` 
CREATE TABLE <test_table_name1> (<field_name1> <data_type> NOT NULL)
```

**Set a DEFAULT value for a table field**
``` 
CREATE TABLE <test_table_name2> (<field_name1> <data_type>,<field_name2> <data_type> DEFAULT <default_value_of_same_data_type_as_field2> );
```

**Set a PRIMARY KEY**
```
CREATE TABLE <test_table_name3>( <field_name1> <data_type>, <field_name2> <data_type> , PRIMARY KEY(field_number_of_choice));
```
_**ALSO VALID**_

```
CREATE TABLE <test_table_name4>( <field_name1> <data_type> PRIMARY KEY, <field_name2> <data_type>  );
```
**Create a table with an ID Field (with AUTO_INCREMENT)**
```
CREATE TABLE <test_table_name5> (<field_name1> INT AUTO_INCREMENT PRIMARY KEY, <field_name2> <data_type> );
```

## USEFUL FUNCTIONS

**CHAR_LENGTH()**
_Example_

```
SELECT CHAR_LENGTH(<column_name>) FROM <table_name>;
```



