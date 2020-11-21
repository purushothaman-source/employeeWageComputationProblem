#! /bin/bash 
IS_PART_TIME=1 
IS_FULL_TIME=2 
MAX_HRS_IN_MONTH=100 
EMP_RATE_PER_HR=20 
NUM_WORKING_DAYS=20 
totalEmpHrs=0 
totalWorkingDays=0 
totalWorkHours=0  
totalsalary=0
#Declaring dictionary 
declare -A dayWiseWages 
function  calculateDailyWage() 
{ 
        empHrs=$1 
        daySalary=$(( $empHrs * $EMP_RATE_PER_HR )) 
        echo $daySalary 
} 
 function getWorkingHours() 
{ 
        case $1 in 
                $IS_FULL_TIME ) empHrs=8 
                        ;; 
                $IS_PART_TIME ) empHrs=4 
                        ;; 
                *) empHrs=0 
                        ;; 
        esac 
        echo $empHrs 
}         
 
while(( $totalWorkHours <  $MAX_HRS_IN_MONTH && $totalWorkingDays < $NUM_WORKING_DAYS )) 
do 
        ((totalWorkingDays++)) 
        #Calling function getWorkingHours by passing random number 
        workHours="$( getWorkingHours $(( RANDOM%3 )) )"  
       # echo "Work hours from function getWorkingHours::::: $workHours "
         salary=$(($workHours*$EMP_RATE_PER_HR))
         totalsalary=$(($totalsalary + $salary ))
         totalSalaryDict[$totalWorkingDays]="$totalsalary"        
        totalWorkHours=$(( $totalWorkHours + $workHours )) 
        #echo -e "TotalWorkHours: $totalWorkHours\n"  
        #Using array to store day-wise salary 
        empDailyWage[$totalWorkingDays]="$( calculateDailyWage $workHours )"  
        
done    
totalSalary=$(( $totalWorkHours * $EMP_RATE_PER_HR )); 

echo -e "empDailyWAge : ${empDailyWage[@]}"
echo -e "totalWage : ${totalSalaryDict[@]}"
echo "TOTAL SALARY : $totalSalary"

