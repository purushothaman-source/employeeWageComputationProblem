#! /bin/bash
IS_PART_TIME=1
IS_FULL_TIME=2
EMP_RATE_PER_HR=20
MAX_HRS_IN_MONTH=100
NUM_WORKING_DAYS=20
totalEmpHrs=0
totalWorkingDays=0
function Workhours(){
  case  $random in
                $IS_PART_TIME) empHrs=4
                                ;;
                $IS_FULL_TIME) empHrs=8
                                ;;
                        *) empHrs=0
         esac
}
while(( $totalEmpHrs < $MAX_HRS_IN_MONTH && $totalWorkingDays < $NUM_WORKING_DAYS ))
do
                ((totalWorkingDays++))
                echo "Total working day: $totalWorkingDays"
                random=$(( RANDOM%3 ))
  		Workhours
          totalEmpHrs=$((  $totalEmpHrs + $empHrs     ))
          echo "Total Employee Hours: $totalEmpHrs"
done
totalSalary=$((  $totalEmpHrs * $EMP_RATE_PER_HR))
echo "Total Salary: $totalSalary"
