echo "Enter Student Marks for 5 subjects: "
read s1
read s2
read s3
read s4
read s5

total_marks=$((s1+s2+s3+s4+s5))
avg_marks=$((total_marks/5))

echo "Total Marks = $total_marks"
echo "Avg Marks = $avg_marks"

if [[ $avg_marks -ge 90 ]]
then
	echo "Grade A"
elif [[ $avg_marks -ge 75 ]]
then
	echo "Grade B"
elif [[ $avg_marks -ge 60 ]]
then
	echo "Grade C"
elif [[ $avg_marks -ge 50 ]]
then
	echo "Grade D"
else
	echo "Fail"
fi
