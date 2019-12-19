# Adjust
● Build instructions
This test script is a Bash compliant testing script, the shebang has been provided in the code so you can run code in any operating system that supports Bash. You can just copy it to any directory that you have access to it.
● Usage
The main random generator script file is “rndgen.sh”. To run the test, generator script and test script should be in same directory. You can specify the generator script name as an argument to the test script. For example, to run it from current directory you can run “./testscr.sh rndgen.sh”. The filename could have any name as you want, but must contains generator code.    
● Description
It provides a simple way to verify the result of the program that generate 10 unique random numbers between 1 to 10. Test will be passed if all generated numbers are unique and all of them are smaller or equal to 10. The test script has two phases, in phase one check all random numbers that are less or equal to ten, and in second phase checks that there are no repeated numbers and all numbers are unique. To pass the test, all phases should be passed. Script`s output clearly shows the results.
● Known limitations / bugs
Test script just accept relative path file name as argument. Absolute path is not supported in this version.
It can run with any script files, so the results from unknown code is not predictable.
