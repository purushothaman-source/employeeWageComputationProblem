#!/bin/bash
isPresent=1
random=$(( RANDOM%2  ))
echo "Random number: "$random
if(( $random == $isPresent  ))
then
        echo "Employee is Present!"
else
        echo "Employee is absent!"
fi
