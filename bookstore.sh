file="books.txt"

#Display all books
display_books(){
	echo "Book Records: "
	cat $file
}

#search for a book
search_book(){
	echo "Enter Book Name: "
	read name
	if grep -i "$name" "$file"; then
		echo "Book Found"
	else
		echo "Book Not Found"
	fi
}

#count books that are out of stock
count_outofstock(){
	count=$(grep -c "OutOfStock" "$file")
	echo "Number of Out of Stock Books: $count"
}

#Update book stock status
update_stock(){
	echo "Enter the book id: "
	read id
	echo "Status to be updated(Available/OutOfStock); "
	read status
	sed -i "/^$id,/ s/Available\|OutOfStock/$status/" "$file"
}

#Calculate total inventory value
inventory_val(){
	total=$(awk -F',' '$4=="Available" {sum+=$5} END {print sum}' "$file")
	echo "Total inventory value: $total"
}

#display books by category
display_cat(){
	echo  "Enter category: "
	read category

	awk -F',' -v cat="$category" '
	BEGIN{ print "Books in Category: ", cat }
	$3==cat{ print $0 }
	' "$file"
}

#find costilest book
costly_book(){
	awk -F',' '
	BEGIN{
		max=0
	}
	{
		if($5>max)
		{
			max =$5
			book=$2
		}
	}
	END{
		print "Costliest book name:",book
		print "Cost:",max
	}

	' "$file"

}

# Menu
while true
do

echo
echo "====================================="
echo " Book Store Inventory Management"
echo "====================================="
echo "1.Display Book Records"
echo "2.Search Book"
echo "3.Count Out Of Stock Books"
echo "4.Update Stock Status"
echo "5.Total Inventory value"
echo "6.Category Books"
echo "7.Costliest Book"
echo "8.Exit"

echo "Enter Choice:"
read choice

case $choice in

1)

display_books
;;
2)
search_book
;;
3)
count_outofstock
;;

4)
update_stock
;;
5)

inventory_val
;;
6)

display_cat
;;
7)
costly_book
;;
8)
echo "Thank You"
break
;;
*)
echo "Invalid choice"

esac
done
