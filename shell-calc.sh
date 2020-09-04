#!/bin/bash
# calculator.sh
# James Yoannou
# Student ID: 500501975
# Assignment #1 - Simulate a simple calculator
# CCPS393 LEC (5347)
# Instructor: L. Hiraki
# Purpose: To simulate the functionality of a basic dollar store calculator.

clear

echo
echo -------------------------------------------------------------------
echo Welcome to Simple Calculator.
echo Input operands and operators sequentially according to the prompts.
echo -------------------------------------------------------------------
echo
echo 'X' to exit
echo 'C' to clear the current value
echo 'MS' to store current value to memory
echo 'M+' to add the value of memory to the current value
echo 'MC' to clear the contents of memory
echo 'MR' to use the contents of memory as a value
echo
echo -------------------------------------------------------------------

# Declaring key variables:
operand1=0
mem=0 

# External while-loop needed for 'C' (clear) command:
while [ true ]
do

	# Prompt user for the first operand: Loop required to ensure proper input before progressing.
	while [ true ]
	do
	echo -n "Enter operand: "
	read operand1
		
		# If operand is a number, we move on to the operator:
		if [[ "$operand1" =~ ^[0123456789.-]+$ ]]; then
			break
		# If not, we test for the following conditions:
		else
			case $operand1 in
			[x] | [X])
				echo "Hasta la vista, baby!"
				exit
				;;
			[c] | [C])
				operand1=0
	                        echo "----------------"
	                        echo "Results cleared."
	                        echo "----------------"
				;;
			'MR')
				operand1=$mem
				break
				;;
	                'MC')
	                        mem=0
	                        echo "Memory cleared."
	                        ;;
			'MS')
				mem=$operator1
				echo "$operator1 stored in memory."
				;;
			*)
				echo "Invalid input. Please enter a number."
				;;
			esac
		fi
	done
	
	# ----------------------------------------------------
	# We loop the rest of the calculator from here.
	# This loop will only exit on the 'X' and 'C' commands
	# ----------------------------------------------------
	
	# Prompt user for an operator:
	while [ true ]
	do
	echo -n "Enter operator: "
	read operator		
		
		# ADDITION -------
		if [ "$operator" = '+' ]; then
			while [ true ]
			do	
			echo -n "Enter operand: "
			read operand2
			        if [[ "$operand2" =~ ^[0123456789.-]+$ ]]; then
					temp=$operand1
		                	operand1=$(bc <<< $operand1+$operand2)
					echo "$temp + $operand2 = $operand1"
		                break
		# Checking other conditions:
		        else
		                case $operand2 in
		                [x] | [X])
					echo "Until next time."
		                        exit
		                        ;;
		                [c] | [C])
		                        operand1=0
					echo "----------------"
					echo "Results cleared."
	                                echo "----------------"
					break 2
		                        ;;
				'MC')
	                		mem=0
	                		echo "Memory cleared."
	                		;;
				'MR')
					temp=$operand1
					operand1=$(bc <<< $operand1+$mem)
					echo "$temp + $mem = $operand1"
					break
					;;
		                *)
		                        echo "Invalid input. Please enter a number."
	        	                ;;
	       	        	 esac
				fi
			done
	
		# SUBTRACTION -------
		elif [ "$operator" = '-' ]; then
			while [ true ]
			do
			echo -n "Enter operand: "
			read operand2
				if [[ "$operand2" =~ ^[0123456789.-]+$ ]]; then
					temp=$operand1
					operand1=$(bc <<< $operand1-"${operand2}")
					echo "$temp - $operand2 = $operand1"
				break
			# Checking other conditions:
			else
				case $operand2 in
				[x] | [X])
					echo "Take it easy."
					exit
					;;
				[c] | [C])
					operand1=0
	                                echo "----------------"
					echo "Results cleared."
	                                echo "----------------"
					break 2
					;;
				'MC')
	                		mem=0
	                		echo "Memory cleared."
	                		;;
	                        'MR')
	                                temp=$operand1
	                                operand1=$(bc <<< $operand1-$mem)
	                                echo "$temp - $mem = $operand1"
	                                break
	                                ;;
				*)
					echo "Invalid input. Please enter a number."
					;;
				esac
				fi
			done
	
		# MULTIPLICATION -------
	        elif [ "$operator" = '*' ]; then
	                while [ true ]
	                do
	                echo -n "Enter operand: "
	                read operand2
	                        if [[ "$operand2" =~ ^[0123456789.-]+$ ]]; then
	                                temp=$operand1
	                                operand1=$(bc <<< $operand1*$operand2)
	                                echo "$temp * $operand2 = $operand1"
	                        break
	                # Checking other conditions:
	                else
	                        case $operand2 in
	                        [x] | [X])
					echo "Seeya later!"
	                                exit
	                                ;;
	                        [c] | [C])
	                                operand1=0
	                                echo "----------------"
					echo "Results cleared."
	                                echo "----------------"
					break 2
	                                ;;
				'MC')
	                		mem=0
	                		echo "Memory cleared."
	               	 		;;
	                        'MR')
	                                temp=$operand1
	                                operand1=$(bc <<< $operand1*$mem)
	                                echo "$temp * $mem = $operand1"
	                                break
	                                ;;
	                        *)
	                                echo "Invalid input. Please enter a number."
	                                ;;
	                        esac
	                        fi
	                done
	
		# DIVISION -------
	        elif [ "$operator" = '/' ]; then
	                while [ true ]
	                do
	                echo -n "Enter operand: "
	                read operand2
				if [ "$operand2" -eq 0 ]; then
					echo "Cannot divide by zero. Please re-enter divisor."
	                        elif [[ "$operand2" =~ ^[0123456789.-]+$ ]]; then
	                                temp=$operand1
	                                operand1=$(bc <<< $operand1/$operand2)
	                                echo "$temp / $operand2 = $operand1"
	                        break
	                # Checking other conditions:
	                else
	                        case $operand2 in
	                        [x] | [X])
					echo "Adios."
	                                exit
	                                ;;
	                        [c] | [C])
	                                operand1=0
	                                echo "----------------"
					echo "Results cleared."
	                                echo "----------------"
					break 2
	                                ;;
				'MC')
					mem=0
					echo "Memory cleared."
					;;
				# MR must still ensure that a value of 0 will be rejected:
	                        'MR')
	                                temp=$operand1
						if [ "$mem" = '0' ]; then
							echo "Cannot divide by zero. Please re-enter divisor."
							continue
						else						
	                                		operand1=$(bc <<< $operand1/$mem)
	                                		echo "$temp / $mem = $operand1"
						fi
	                                break
	                                ;;
	                        *)
	                                echo "Invalid input. Please enter a number."
	                                ;;
	                        esac
	                        fi
	                done
	        fi
	
		# Using a case statement to check for all remaining possible operators.
		# If-statements were required above to check for regex and ensure a numeric value was entered,
		# which isn't possible within a case statement:
	
		case $operator in
		[x] | [X])
			echo "Cheers."
			exit
			;;
		[c] | [C])
			operand1=0
	                echo "----------------"
			echo "Results cleared."
	                echo "----------------"
			break
			;;
		'MS')
			mem=$operand1
			echo "$operand1 stored in memory."
			;;
		'M+')
			temp=$mem
			mem=$(bc <<< $operand1+$temp)
			echo "$operand1 + $temp = $mem -- Sum stored in memory."
			;;
		'MC')
			mem=0
			echo "Memory cleared."
			;;
		'+')
			continue
			;;
		'-')
			continue
			;;
		'*')
			continue
			;;
		'/')
			continue
			;;
		*)
			echo "------------------------------------------"
			echo "Invalid input. Please enter an operator."
			echo "Valid operators are: + - * / MS MR M+ MC C X"
			echo "------------------------------------------"
			;;
		esac
	
	done
done
