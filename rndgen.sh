#!/bin/bash
#rndgen
#This script generate the unique numbers from 1 to 10 in random order.
#No argument need to be specified


#An array to store random generated numbers
rndNumbers=()
declare -i i=0

#Generate random numbers and add it to the array, if it is unique.
while ((i<10)); do
   tmpRnd=$(((RANDOM%10)+1))
   nonDuplicate=1
   for item in ${rndNumbers[@]}; do
      if ((item==tmpRnd)); then
         nonDuplicate=0
	 break
      fi
   done
   if ((nonDuplicate)); then
      rndNumbers[$i]=$tmpRnd
      i+=1
   fi
done

#Write accepted numbers to output
for item in ${rndNumbers[@]}; do
   echo $item
done

