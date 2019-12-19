#!/bin/bash
#testscr
#A test script that checks the results that has been provided by "rndgen" script"
#argument 1 is the name of the generator script, default name is rndgen
 
declare -i phase1=1
declare -i phase2=1
declare -i repeated=0

#Check the arguments, and provide output if the argument is not valid.
case "$1" in
   "")
      echo "No script file has been specified"
      echo "Usage: testscr.sh <filename>"
      exit 0;;
   *)
      eval "./$1"  2> /dev/null
      if (($? == 0)); then
         eval "./$1" > test_output.txt
      else 
         echo "Script file name is not correct, please use relative path and try again"
         exit 1
      fi
   esac

#Read the input data from temporary file
input="./test_output.txt"
echo "Phase1 test is running, all numbers must be between 1 to 10"

#Itterate numbers from input, add them to an array and check the desire condition.
while IFS= read line
do
   rndNumbers+=("$line")
   if ((line<= 10)); then
      echo "Random number value is acceptable ... DONE"
      sum+=line
   else
      echo "Random number value isnt accesptable ... Faild"
      phase1=0
   fi
done < "$input"

echo "Phase 2 test is running, all numbers must be unique"

#Check the numbers are unique or not
for item in ${rndNumbers[@]}; do
   repeated=0
   for ((i=0;i<10;i++)); do
      if ((item==rndNumbers[$i])); then
         repeated+=1
      fi
   done
   if ((repeated>1)); then
      phase2=0
   fi
done
if ((phase2)); then
   echo "All Random Numbers are Unique ... DONE"
else
   echo "Phase 2 Test Faild, Numbers are not uniqe"
   phase2=0
fi

if ((phase1)) && ((phase2)); then
   echo "Test successfuly Done!"
else
   echo "Test Faild"
fi

rm -f test_output.txt
