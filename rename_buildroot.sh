#! /bin/sh
str_working_buildroot=buildroot.txt
#current_proj=$(cat buildroot.txt)
current_proj=$(cat $str_working_buildroot)
if [ "$1" == "$current_proj" ]
then echo "it is the project you are working with"; exit; 
fi

echo "current project is :" $current_proj ;
echo "switch to :" $1 ;

echo $1 > buildroot.txt ;
mv buildroot buildroot-$current_proj
mv buildroot-$1 buildroot
cp buildroot.txt buildroot/

