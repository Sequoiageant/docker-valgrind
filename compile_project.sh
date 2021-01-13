#!/bin/bash

# Set "yes" if you are using makefile, "no" if not
makefile="no"

# Choose the commande to execute your binary, with the aruguments if needed
exec="./a.out"


# ============================================================
# In case not using Makefile ("makefile="no"")
# ============================================================

# Choose compilator
compilator="clang++"

# List here all the files you want to compile, separated by space
files_to_test="main.cpp"

# Choose the flages for compilation
flags="-Wall -Wextra -Werror"

# ============================================================



# Go into test folder in container
cd /test

# Run compilation
if [ $makefile = "yes" ]
then
make
else
$compilator -g $flags $files_to_test 
fi

# Run valgrind test
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $exec

# Uncomment if you need to launch bash inside docker:
/bin/bash
