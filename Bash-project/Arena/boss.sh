#!/bin/bash

# 1. Create the Battlefield directory 
mkdir -p Battlefield 

# 2. Create  the three files inside it 
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

# 3. If knight.txt exists, move it to Archive 
if [ -f Battlefield/knight.txt ]; then 
mkdir -p Archive 
mv Battlefield/knight.txt Archive/
echo "knight.txt moved to Archive"
else 
echo "knight.txt not found"
fi 

#4. List the contents on both directories 
echo "Battlefield:"
ls Battlefield 
echo "Archive:"
ls Archive 


