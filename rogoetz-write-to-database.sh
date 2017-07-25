#!/bin/bash 

#set credentials
MYSQLUSER=root
MYSQLPASS=root

# Set database and table names
MYDATABASE=favbooks
MYTABLE=favbooks

#put data where MySQL can find it 
sudo cp tmp.csv /var/lib/mysql-files/

#enter data input 
echo "Writing new data to table."
mysql -u"$MYSQLUSER" -p"$MYSQLPASS" -e "LOAD DATA INFILE '/var/lib/mysql-files/tmp.csv' INTO TABLE $MYTABLE FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';" $MYDATABASE
echo "Congratulations, your data has been entered successfully."

#put database into a .sql file 
echo "Survey data dumped to file `date --iso-8601=seconds`-$MYDATABASE.sql"
mysqldump -u"$MYSQLUSER" -p"$MYSQLPASS" $MYDATABASE > `date --iso-8601=seconds`-$MYDATABASE.sql
