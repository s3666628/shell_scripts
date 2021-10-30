#!/bin/sh -x
     PRINTF=/usr/bin/printf
     LS=/bin/ls
     PWD=/bin/pwd
     SLEEP=/bin/sleep
     QUIT=0
     menu(){
$CLEAR
$PRINTF "\n"
$PRINTF " User Menu System\n"
$PRINTF " ==================\n"
$PRINTF "\n"
$PRINTF " 1) Say hello\n"
$PRINTF " 2) Display name of current directory\n" $PRINTF " 3) List current directory contents\n" $PRINTF " 4) Say goodbye\n"
$PRINTF "\n"
$PRINTF " Q) Quit this menu system\n"
$PRINTF "\n"
$PRINTF "\n"
$PRINTF " Enter your choice ==> "
return
     }
     #########################################
# Actual script entry point is here
     #########################################
     while [ $QUIT -eq 0 ] ; do
     menu

      read CHOICE
      case $CHOICE in
1)
      $PRINTF "\n"
$PRINTF "\n"
$PRINTF "Hello World\n" $SLEEP 5
;;
2)
      $PRINTF "\n"
      $PRINTF "\n"
      $PWD
      $SLEEP 5
      ;;
3)
      $PRINTF "\n"
$PRINTF "\n" $LS
$SLEEP 5
;;
4)
     $PRINTF "\n"
     $PRINTF "\n"
     $PRINTF "And that's goodnight from me\n"
     $SLEEP 5
     ;;
[Qq])
     QUIT=1;;
?)
     $PRINTF "\n"
$PRINTF "\n"
$PRINTF "Invalid option entered\n"
$PRINTF "Valid options are 1, 2, 3, 4, and Q\n" $SLEEP 5;;
esac
done
