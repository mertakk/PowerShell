New-Item -Path 'C:\temp\Test Folder' -ItemType Directory //create folder

New-Item -Path 'C:\temp\Test Folder\Test File.txt' -ItemType File //create file

Copy-Item 'C:\temp\Test Folder' 'C:\temp\Test Folder1' //copy folder

Copy-Item 'C:\temp\Test Folder' -Destination 'C:\temp\Test Folder1' //copy folder with items

Copy-Item 'C:\temp\Test Folder\Test File.txt' 'C:\temp\Test Folder1\Test File1.txt' //copy file

Copy-Item -Filter *.txt -Path 'C:\temp\Test Folder' -Recurse -Destination 'C:\temp\Test Folder1' //recursive copy file

Remove-Item 'C:\temp\Test Folder1' //delete folder with warning

Remove-Item 'C:\temp\Test Folder' -Recurse //recursive (no warning for inside items)

Remove-Item 'C:\temp\Test Folder\test.txt' //delete file with warning

Remove-Item 'C:\temp\Test Folder' -Recurse //recursive (no warning for inside items)

Move-Item C:\temp\Test C:\temp\Test1 //move folders

Move-Item c:\temp\Test\Test.txt C:\temp\Test1 //move files from Test to Test1

Rename-Item c:\temp\Test c:\temp\Test1 //rename folder to Test1

Rename-Item C:\temp\Test\test.txt test1.txt //rename file name to test1

Get-Content C:\temp\Test\test.txt //get content as an array

(Get-Content C:\temp\test\test.txt).length //to learn size of text

Test-Path C:\temp\test //check folder existence

Test-Path C:\temp\test\test.txt //check file existence

Get-Date //gets system date with hour

set-date -Date (Get-Date).AddDays(1) //adds system date 1

set-date -Date (Get-Date).AddDays(-1) //decreases system date by 1

Get-Date -DisplayHint Date //get date without hour

Get-Date -DisplayHint Time //get date hour only

$timeToAdd = New-TimeSpan -Minutes +60
set-date -adjust $timeToAdd    //Add time 1 hour

$timeToAdd = New-TimeSpan -Minutes -60
set-date -adjust $timeToAdd    //Decrease time 1 hour

New-Item C:\temp\test.txt //create text
Set-Content C:\temp\test.txt 'Welcome to TutorialsPoint'  //modify text
get-Content C:\temp\test.txt //get text content

New-Item C:\temp\test.xml -ItemType File  //txt dışındaki hepsine itemtype geliyor
Set-Content C:\temp\test.xml '<title>Welcome to TutorialsPoint</title>'
Get-Content C:\temp\test.xml

Clear-Content C:\temp\test.txt //erase content

Add-Content C:\temp\test.txt 'World!' //add content

$list = "one","two","two","three","four","five"
$list
$list | sort | get-unique //aynı olandan 1 tane kalana kadar çıkarıyor

get-content C:\temp\test.txt | measure-object -character -line -word //txt uzunluğunu gösterir
Get-ChildItem | Measure-Object //count the no. of files present in current directory.

Compare-Object -ReferenceObject $(Get-Content C:\temp\test.txt) -DifferenceObject $(Get-Content C:\temp\test1.txt) //iki file karşılaştırır ve aynı satırı gösterir
Compare-Object -ReferenceObject $(Get-Content C:\temp\test.txt) -DifferenceObject $(Get-Content C:\temp\test1.txt) -IncludeEqual //tüm satırları karşılaştırır

$A = Get-ChildItem C:\temp\*.txt //Get the file details in a variable.
Format-List -InputObject $A //Show file details
Get-Service | Format-List //List of services

Format-Wide -InputObject $A //Show file details with format-wide
Format-Wide -InputObject $A -Property Length //Get required property

Get-Service | Where-Object {$_.Status -eq "Stopped"} //Show stopped services
Get-Process | Where-Object {$_.ProcessName -Match "^p.*"} //Show stopped services based on process name

Get-ChildItem -Name //Get the names of the items in current directory.

1000,2000,3000 | ForEach-Object -Process {$_/1000} //dizinin her bir elemanını 1000e bölüyor

"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object {$_.Split(".")} //girilen isimleri nokta işaretine göre bölüyor-split

Start-Sleep -s 15 //15 saniye durduruyor powershelli
Start-Sleep -m 500 //500 milisaniye durduruyor powershelli

$choice = Read-Host "Please put your choice" //javanın scannerı
$choice //show input

Get-Process | Select-Object -Property ProcessName, Id, WS -Last 5 //son 5 process i object yapıyor
"a","b","c","a","a","a" | Select-Object -Unique //farklı olanları seçiyor

Get-Process | Sort-Object -Property WS | Select-Object -Last 5 //WS değerine göre sıralıyor process leri
"d","e","c","a","b","f" | Sort-Object //alfabetik sıralıyor

Write-Warning  "Test Warning" //uyarı mesajı

Write-Host (2,4,6,8,10,12) -Separator ", -> " -ForegroundColor DarkGreen -BackgroundColor White //özel mesaj arkaplan beyaz yazı yeşil aralarına , -> koyuyor

Invoke-Item "C:\Temp\test.txt" //txt notepad ile açıldı

 $Command = 'Get-Process'
 $Command
Get-Process
 Invoke-Expression $Command //invoke expression task ı uyguladığı anda yazdırıyor ekrana

 Measure-Command { Get-EventLog "Windows PowerShell" } //get eventlog komutunun gerçekleşme süresini gösteriyor. herhangi bir komut için yapılabilir.

 Invoke-History //son komutu tekrar uyguluyor

 get-history //komut geçmişini gösteriyor.
 Get-history -count 5 | Add-history //komut geçmişinin sonuna son 5 komutu tekrar ekliyor.

 Get-Culture //get culture settings

 Get-Process | Group-Object -Property Name -NoElement | Where-Object {$_.Count -gt 1} //process sayılarına göre grupluyor bu örnekte. NoElement olunca process lerin ne process i olduğunu yazdırmıyor
 
 $location = Get-Location //variable dolar ile başlar, bu komut path i variable a atar.
 $location | Get-Member //show variable type and info
 $location 
 //değişkeni gösterir

 dir > test.log //test.log a directory yi yazar


 $array = @("item1", "item2", "item3")
 for($i = 0; $i -lt $array.length; $i++){ $array[$i] } //diziyi yazdırıyor for loop -lt demek küçüktür yani less than anlamına geliyor aynı javadaki gibi | işareti farklı satır anlamına gelmiyor, kodları birbirine bağlayan bir işaret gibi görev görüyor.

 foreach ($element in $array) { $element }
 IIII
 $array | foreach { $_ } //bu iki foreach aynı $_ o anki variable anlamına geliyor.

 $array = @("item1", "item2", "item3")
 $counter = 0;
 while($counter -lt $array.length){
   $array[$counter]
   $counter += 1
 } //üstteki for loop un aynısı while ile yazılmış

 $array = @("item1", "item2", "item3")
 $counter = 0;
 do {
   $array[$counter]
   $counter += 1
 } while($counter -lt $array.length) //aynı for loop do while ile yazılmış


$x = 10
if($x -le 20){
   write-host("This is if statement")
}

$x = 30
if($x -le 20){
   write-host("This is if statement")
}else {
   write-host("This is else statement")
}

$x = 30
if($x -eq 10){
   write-host("Value of X is 10")
} elseif($x -eq 20){
   write-host("Value of X is 20")
} elseif($x -eq 30){
   write-host("Value of X is 30")
} else {
   write-host("This is else statement")
}

$x = 30
$y = 10
if($x -eq 30){     //nested if statement
   if($y -eq 10) {
      write-host("X = 30 and Y = 10")
   }
}   

switch(3){
   1 {"One"}
   2 {"Two"}
   3 {"Three"}
   4 {"Four"}
   3 {"Three Again"} //three three again
}

switch(3){ //three
   1 {"One"}
   2 {"Two"}
   3 {"Three"; break }
   4 {"Four"}
   3 {"Three Again"}
}

switch(4,2){
   1 {"One"}
   2 {"Two"}
   3 {"Three"; break }
   4 {"Four"}
   3 {"Three Again"}  //four two
}

[int32[]]$intA = 1500,2230,3350,4000
$A = 1, 2, 3, 4
$A.getType()

$myList = 5.6, 4.5, 3.3, 13.2, 4.0, 34.33, 34.0, 45.45, 99.993, 11123

write-host("Print all the array elements")
$myList

write-host("Get the length of array")
$myList.Length

write-host("Get Second element of array")
$myList[1]

write-host("Get partial array")
$subList = $myList[1..3]

write-host("print subList")
$subList

write-host("using for loop")
for ($i = 0; $i -le ($myList.length - 1); $i += 1) {
  $myList[$i]
}

write-host("using forEach Loop")
foreach ($element in $myList) {
  $element
}

write-host("using while Loop")
$i = 0
while($i -lt 4) {
  $myList[$i];
  $i++
}

write-host("Assign values")
$myList[1] = 10
$myList
$myList = @(0..4)
write-host("Print array")
$myList
$myList = @(0..4)
write-host("Assign values")
$myList[1]  = 10
$myList































