mkdir wills1
mkdir wills2
touch b1.txt b2.txt b3.txt b4.txt b5.txt

cp b1.txt b4.txt
mv b5.txt b5_rename.txt
find -name "b3.txt"
chmod +x b4.txt
tar -czf b4.tar.gz b4.txt
tar -xzf b4.tar.gz -C wills2
cd ..
ls -l  
