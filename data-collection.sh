#!/bin/bash 

# Echo 'hello and welcome'
echo "Hello, and thank you for taking this survey"
echo " "

# Echo 'Q1
echo "What is your favorite book?"

# Read Q1
read FAVORITEBOOK 

# echo Q1A
echo "Who is the author?"
read AUTHOR

# Echo Q2
echo "how old were you when you read this book?"

# Read Q2
read AGEREAD

# Echo Q4
echo "Have you ever reread this book?"

# Read Q4
read REREAD

# Echo Q5 
echo "do you own your favorite book?"

# Read Q5 
read OWNED


# add timestamp 
TIMESTAMP=`date --iso-8601=seconds`

#create unique identifier
 UNIQUEID=`echo "$(od -An -N4 -tu4 /dev/random)"`    

# create CSV file with entered variables
echo "$TIMESTAMP, $UNIQUEID, $FAVORITEBOOK, $AUTHOR, $AGEREAD, $REREAD, $OWNED" >> ./tmp.csv

#cat the info back 
cat ./tmp.csv 

#back it up 
cat ./tmp.csv >> data-backup.csv

#put it in the right place 
sudo cp ./tmp.csv /var/lib/mysql-files/

