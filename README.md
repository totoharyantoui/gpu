# gpu
Sebelum masuk ke program, untuk mengetahui spesifiksai umum dan apakah GPU sedang digunakan atau tidak, dapat digunakan perintah :

nvidsmi 

Berikut adalah penjelasan dari Program move.cu
<br>
Program move.cu adalah ilustrasi yang menggambarkan bagaimana perpindahan data dari variabel a_h ke b_h melalui GPU

Cara melaukan kompilasi: 
<br>
Untuk melakukan kompilasi program move.cu

nvcc -o move move.cu 

Hasilnya akan terbentuk file move yang bersifat executable
Berikutnya, jalankan file move

./move


