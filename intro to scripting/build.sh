## 1.1.1 ... Version
#!/bin/bash

# Welcome the user
echo 'Hello Stranger'

# Let’s verify with the user that they have updated changelog.md with the current release version. ## 11.2.3
# By default, head returns 10 lines. But in this example, we want the first line. We can use the -n argument to specify the number of lines:
firstline=$(head -n 1 source/changelog.md)
#echo $firstline

# The command read can be used to split a string into an array using the -a argument
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo 'You are using version ->' $version

echo 'Now select "0" to cancel or "1" to move forward'

read versioncontinue
files=source/*
new_files=build/*

if [ $versioncontinue -eq 1 ]
then
  echo "OK, we will start by printing files in the source dir"
  for file in $files
  do
    echo $file
    if [ $file == 'source/secretinfo.md' ]
    then
      echo $file 'wont be copied'
    else
      echo 'Copying...' $file
    fi
  done
else
  echo "Please come back when you are ready"
fi

cd build
echo 'These are the files in the build dir: '
ls
cd ..
