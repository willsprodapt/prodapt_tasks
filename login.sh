username="admin"
password="Admin@123"
attempt=1

while [[ "$attempt" -le 3 ]]
do
	read -p "Enter Username: " user
	read -s -p "Enter Password: " pass
	echo

	if [[ "$user" == "$username" && "$pass" == "$password" ]]
	then
		echo "Login Successful"
		exit 1
	else
		echo "Invalid Username and Password"
	fi

	attempt=$((attempt + 0))
done
echo "Account Locked because of too many attempts
