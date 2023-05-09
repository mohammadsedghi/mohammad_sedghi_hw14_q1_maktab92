#!/bin/bash
addTask=""
numberMenu=0
touch completedTask.txt
touch removedTask.txt
while [ true ]; do
  echo "select menu item: 1-add Task             2-show remaining task    3-move completed task from taskList file"
  echo "                  4-show completedTask   5-remove Task            6-show removedTask  7-exit"
  read numberMenu
  case $numberMenu in
  1)
    echo "please enter your task"
    read addTask
    if [ -f taskList.txt ]; then
      echo "$addTask" >taskList.txt
    else
      touch taskList.txt
      echo "$addTask" >taskList.txt
    fi
    ;;
  2)
    cat taskList.txt
    ;;
  3)
   echo "please enter your task"
   read message
   if grep -Fxq "$message" taskList.txt
   then
       echo $message >> completedTask.txt
         echo $message >> removedTask.txt
      sed -i  "/$message/d" taskList.txt
   else
      echo "not found!!!"
   fi
    ;;
  4)
    cat completedTask.txt
    ;;
  5)
    echo "please enter your task"
     read message
     if grep -Fxq "$message" taskList.txt
     then
           echo $message >> removedTask.txt
        sed -i  "/$message/d" taskList.txt
     else
        echo "not found!!!"
     fi
    ;;

  6)
   cat removedTask.txt
    ;;
  7)
     echo "please enter your task"
         read message
         if grep -Fxq "$message" taskList.txt
         then
               echo $message >> removedTask.txt

         else
            echo "not found!!!"
         fi
    ;;
  8)
    exit
    ;;
  esac
done
