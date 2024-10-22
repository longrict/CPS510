#!/bin/sh
MainMenu()
{
while [ "$CHOICE" != "START" ]
	do
	clear
	echo
"================================================================="
	echo "| Oracle All Inclusive Tool
|"
	echo "| Main Menu - Select Desired Operation(s):
|"
	echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
	echo "-------------------------------------------------------------
----"
	echo " $IS_SELECTEDM M) View Manual"
	echo " "
	echo " $IS_SELECTED1  1) Drop Tables"
	echo " $IS_SELECTED2  2) Create Tables"
	echo " $IS_SELECTED3  3) Populate Tables"
	echo " $IS_SELECTED4  4) Query All Tables"
	echo " $IS_SELECTED5  5) Show availablility count per location"
	echo " $IS_SELECTED6  6) Show list of booked models"
	echo " $IS_SELECTED7  7) Show list of clients who have booked multiple cars"
        echo " $IS_SELECTED8  8) Show all employees who work in Toronto or Ottawa"
        echo " $IS_SELECTED9  9) Show all non-reserved cars"
        echo " $IS_SELECTED10 10) Customers who booked from multiple locations"
        echo " $IS_SELECTED11 11) Cars that have been booked before"
	echo " $IS_SELECTED11 12) Remove all records"

	
	echo " "
	echo " $IS_SELECTEDE E) End/Exit"
	echo "Choose: "
	read CHOICE
	if [ "$CHOICE" = "0" ] 
	then
		echo "Nothing Here"
	elif [ "$CHOICE" = "1" ]
	then
		bash droptables.sh
                echo "Press any key to continue..."
                read input

	elif [ "$CHOICE" = "2" ]
	then
		bash createtables.sh
		echo "Press any key to continue..."
                read input


	elif [ "$CHOICE" = "3" ]
	then
		bash populatetables.sh
	        echo "Press any key to continue..."
                read input

	
	elif [ "$CHOICE" = "4" ]
	then
		bash viewtables.sh
		echo "Press any key to continue..."
    		read input		
        
	elif [ "$CHOICE" = "5" ]
        then
                bash showavailable.sh
                echo "Press any key to continue..."
                read input
        
	elif [ "$CHOICE" = "6" ]
        then
                bash showbookedmodels.sh
                echo "Press any key to continue..."
                read input
        
	elif [ "$CHOICE" = "7" ]
        then
                bash multiplebookings.sh
                echo "Press any key to continue..."
                read input

        elif [ "$CHOICE" = "8" ]
        then
                bash torontoottawaemployees.sh
                echo "Press any key to continue..."
                read input

        elif [ "$CHOICE" = "9" ]
        then
                bash notreserved.sh
                echo "Press any key to continue..."
                read input

	elif [ "$CHOICE" = "10" ]
        then
                bash multiplelocations.sh
                echo "Press any key to continue..."
                read input
	
	elif [ "$CHOICE" = "11" ]
        then
                bash hasbeenbooked.sh
                echo "Press any key to continue..."
                read input

	elif [ "$CHOICE" = "12" ]
        then
                bash removerecords.sh
                echo "Press any key to continue..."
                read input




	elif [ "$CHOICE" = "E" ]
then
exit
fi
done
}
#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
	StartMessage
	while [ 1 ]
	do
	MainMenu
	done
}
ProgramStart
