# dicoLink

>full bash (wget)
> a centralized database to link security testing lists (xss, xml, path traversal, name, directory ...)

if you have other link to share, you are welcome 


example :

**./dicoLink.sh** 
dicoLink help :
-h to get this help
-L list all db
-l listall db without url
-D Download active url
-d <id> upload id url 
 

**./dicoLink.sh -l**
Liste all db without url
id  Type   active  filename
0   xss    1       xss-fuzz-xplatforme.txt
1   xss    0       xss-fuzz-win.txt
2   xss    0       xss-fuzz-unix.txt
3   xpath  1       xpath-fuzz.txt
4   sql    0       sql-fuzz-blind.txt
5   sql    1       sql-fuzz-xplatform.txt
6   xml    1       xml-fuzz.txt
7   rfi    1       rfi-fuzz.txt
8   pt     1       path-traversal-fuzz.txt
9   mix    1       mix-fuzz.txt
10  file   0       filename.txt

**./dicoLink.sh -d 9**
GET mix-fuzz.txt
