#! /bin/bash 
IS_PART_TIME=1 
IS_FULL_TIME=2 
EMP_RATE_PER_HR=20 
NUM_WORKING_DAYS=20 
totalSalary=0 
for(( day=1  ; day <= $NUM_WORKING_DAYS; day++  )) 
do 
        random=$((  RANDOM%3   )) 
        case $random in 
                $IS_PART_TIME) empHrs=4 
                            ;; 
                $IS_FULL_TIME) empHrs=8 
                           ;; 
                *) empHrs=0 
        esac 
    salary=$((  $empHrs * $EMP_RATE_PER_HR)) 
         echo "Day: $day         Salary: $salary" 
      totalSalary=$((  $totalSalary + $salary )) 
done 
echo "Total Salary: $totalSalary" 
