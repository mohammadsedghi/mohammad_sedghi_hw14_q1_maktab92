#!/bin/bash
addTask=""
numberMenu=0
touch completedTask.txt
touch removedTask.txt
while [ true ]; do
  echo "select menu item: 1-add Task             2-show remaining task    3-move completed task from taskList file  4-show completedTask"
  echo "                  5-remove Task          6-show removedTask       7-search                                  8- exit"
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
   if [[ ! -z $(cat taskList.txt) ]] ; then
       cat taskList.txt
   else
       echo "taskList.txt is empty"
   fi

    ;;
  3)
    echo "please enter your task"
    read message
    if grep -Fxq "$message" taskList.txt; then
      echo $message >>completedTask.txt
      echo $message >>removedTask.txt
      sed -i "/$message/d" taskList.txt
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
    if grep -Fxq "$message" taskList.txt; then
      echo $message >>removedTask.txt
      sed -i "/$message/d" taskList.txt
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
    if grep -Fxq "$message" taskList.txt; then
      echo "this task is find in taskList"

    else
      echo "not found!!! in taskList"
    fi
    if grep -Fxq "$message" completedTask.txt; then
      echo "this task is find in completedTask"

    else
      echo "not found!!! in completedTask"
    fi
    if grep -Fxq "$message" removedTask.txt; then
      echo "this task is find in removedTask"

    else
      echo "not found!!! in removedTask"
    fi
    ;;
  8)
    exit
    ;;
  esac
done
