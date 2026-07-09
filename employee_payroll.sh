tax(){
	if [[ $1 -le 30000 ]]
	then
		tax=$(( $1 * 5 / 100 ))
	elif [[ $1 -le 60000 ]]
	then
		tax=$(( $1 * 10 / 100 ))
	else
		tax=$(( $1 * 15 / 100 ))
	fi
}

bonus(){
	if [[ $1 -le 50000 ]]
	then
		bonus=2000
	else
		bonus=5000
	fi
}

net(){
	net=$(( $1 - tax + bonus ))
}

echo "Enter Employee file: "
read file

if [ ! -f "$file" ]
then
	echo "File not found"
	exit
fi

echo "Payroll Report" > payroll_report.txt
echo "ID Name Salary Tax Bonus NetSalary" >> payroll_report.txt

while read id name salary
do
	tax $salary
	bonus $salary
	net $salary

	echo "$id $name $salary $tax $bonus $net" >> payroll_report.txt
done < "$file"

cat payroll_report.txt
