# PA-B23-KELOMPOK10


#Deskripsi Program#

Program kami menyediakan tempat sebagai sarana perantara antara penyedia franchise dari para pemilik franchise yang setiap franchise memiliki berbagai produk yang disediakan kepada para penyewa franchise yang dimana konteks dari penyewa di sini adalah para pedagang yang bisa menyewa dari para penyedia franchise. program disini menyediakan 2 peran yaitu: 1. Sebagai admin 2. Sebagai user dengan penjelasan berikut:

1). Admin
Admin memiliki hak akses untuk mengubah seluruh isi program dengan berbagai opsi seperti mereka dapat melihat dan menambahkan kan produk, menambahkan data franchise, memperbarui data produk dan data franchise, hapus data dari produk franchise dan juga dari franchise, mengubah status dari data franchise tentang status penyewa

2). User
User diharuskan login username dan password dari data yang ada di pedagang. Setelah user masuk, mereka memiliki opsi untuk menyewa franchise dari data yang tersedia dari franchise, mereka juga dapat melihat franchise yang tersedia tetapi mereka tidak bisa mengubah atau menambahkan franchise itu. Selain itu, terdapat juga opsi menyortir secara ascending dan descending berdasarkan nama franchise dan ID dari franchise

#Struktur Project#
![flowchart kemitraan franchise-Menu Login drawio](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/2a941808-fbba-4422-94ae-bff2589e554c)
![flowchart kemitraan franchise-Menu admin drawio](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/2618d2f9-add1-439b-8688-2bf5463b3db8)
![flowchart kemitraan franchise-menu user drawio](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/105a18ee-403d-4b5f-923b-62e5df32b055)



#Fitur dan Fungsionalitas

...

def __init__(self, conn):
        self.conn = conn
        self.cursor = None
        
...

'__init__' digunakan untuk menginisiasikan suatu objek yang berada di dalam sebuah class. Untuk 'self.conn = conn' digunakan untuk mengkoneksikan program ke database yang biasanya digunakan untuk mengambil data dari data base, memperbarui data dan yang terakhir untuk 'cursor' sendiri digunakan untuk mengeksekusi perintah SQL yang memerlukan cursor


...

def connect_database(self):
        try:
            self.conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="kemitraan"
            )
            self.cursor = self.conn.cursor()
            print("Koneksi berhasil!")
        except mysql.connector.Error as err:
            print("Error:", err)

...

'connect_database' sendiri digunakan untuk membuat koneksi baru ke database MySQL. Di dalamnya ada perintah 'mysql.connector' untuk membuat koneksi dengan parameter yang telah ditentukan (seperti nama host, nama user, password, dan nama database).


...


def close_connection(self):
    if self.conn:
        self.conn.close()
        print("Koneksi ditutup.")

...

 'close_connection' ini bertujuan untuk menutup koneksi yang aktif ke database MySQL. 


...

def login(self):
        while True:
            user_name = input("Masukkan nama admin:  ")
            password = input("Masukkan password: ")  # Ubah menjadi string agar sesuai dengan data di database
            try:
                self.cursor = self.conn.cursor()
                sql = "SELECT * FROM admin WHERE user_name = %s AND password = %s"
                val = (user_name, password)
                self.cursor.execute(sql, val)
                result = self.cursor.fetchone()
                if result:
                    print("Login berhasil sebagai admin.")
                    return True
                else:
                    print("Login gagal. Nama admin atau password salah.")
                    coba_lagi = input("Coba lagi? (y/n): ")
                    if coba_lagi.lower() != 'y':
                        return False
            except mysql.connector.Error as err:
                print("Error:", err)
                # Menutup koneksi yang bermasalah
                self.close_connection()
                # Membuat koneksi baru
                self.connect_database()

...

Fungsi selanjutnya ialah login. Disini terdapat loop 'while True' untuk terus meminta nama admin dan password. Setelah mendapatkan masukan dari pengguna, fungsi akan mencoba melakukan proses otentikasi dengan melakukan query SQL ke database menggunakan 'cursor (self.cursor)'. Query tersebut mencari baris dalam tabel admin di mana nama admin (user_name) dan password sesuai dengan masukan yang diberikan oleh pengguna. Setelah eksekusi query, hasilnya diambil menggunakan metode 'fetchone()'. Jika hasilnya tidak kosong (result), maka proses otentikasi berhasil dan pesan "Login berhasil sebagai admin." akan dicetak, dan fungsi akan mengembalikan True untuk menandakan bahwa proses login berhasil. Jika hasilnya kosong (tidak ada baris yang cocok), artinya otentikasi gagal. Pesan "Login gagal. Nama admin atau password salah." akan dicetak, dan pengguna akan ditanya apakah ingin mencoba lagi. Jika pengguna memilih untuk tidak mencoba lagi atau terjadi kesalahan dalam eksekusi query (ditangkap oleh blok except), pesan kesalahan akan dicetak, dan koneksi yang bermasalah akan ditutup '(self.close_connection())', kemudian koneksi baru akan dibuat '(self.connect_database())'.


...

  def menu_admin(self):
        while True:
            print("\nMenu Utama:")
            print("1. Tampilkan Semua Produk")
            print("2. Tampilkan Semua Franchise")
            print("3. Tambah Produk")
            print("4. Tambah Franchise")
            print("5. Perbarui Produk")
            print("6. Perbarui Franchise")
            print("7. Hapus Produk")
            print("8. Hapus Franchise")
            print("9. Keluar")
            pilihan = input("Masukkan pilihan Anda: ")
            if pilihan == '1':
                self.tampilkan_semua_produk()
            elif pilihan == '2':
                self.tampilkan_semua_franchise()
            elif pilihan == '3':
                self.tambah_produk()
            elif pilihan == '4':
                self.tambah_franchise()
            elif pilihan == '5':
                self.perbarui_produk()
            elif pilihan == '6':
                self.perbarui_franchise()
            elif pilihan == '7':
                self.hapus_produk()
            elif pilihan == '8':
                self.hapus_franchise()
            elif pilihan == '9':
                print("Keluar")
                break

...

Fungsi ini menggunakan loop 'while True' sehingga akan terus menampilkan menu dan menerima input dari admin hingga admin memilih untuk keluar. Setelah mencetak menu, fungsi akan meminta input dari admin untuk memilih opsi yang diinginkan. Input ini akan disimpan dalam variabel 'pilihan'. Setelah menerima input, fungsi akan memeriksa nilai dari 'pilihan' menggunakan serangkaian pernyataan 'if-elif'. Bergantung pada nilai 'pilihan', fungsi akan memanggil metode yang sesuai untuk melakukan operasi tertentu, seperti menampilkan semua produk, menambahkan produk baru, menghapus franchise, dan sebagainya. Jika admin memilih opsi '9', artinya admin ingin keluar dari menu, pesan "Keluar" akan dicetak, dan loop akan dihentikan dengan pernyataan 'break', sehingga admin akan keluar dari menu dan kembali ke proses selanjutnya setelahnya.


...

  def tampilkan_semua_produk(self):
        try:
            self.cursor.execute("SELECT * FROM produk_franchise")
            produk = self.cursor.fetchall()
            print("\nSemua Produk:")
            # Membuat objek PrettyTable
            table = PrettyTable()
            # Menambahkan kolom
            table.field_names = ["ID Produk", "Nama Produk", "Keterangan Produk", "Harga", "ID Franchise"]
            # Menambahkan baris untuk setiap entri produk
            for item in produk:
                table.add_row(item)
            print(table)
        except mysql.connector.Error as err:
            print("Error:", err)

...

Fungsi 'tampilkan_semua_produk' bertujuan untuk menampilkan semua produk yang tersimpan dalam tabel 'produk_franchise'.Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua produk dari tabel 'produk_franchise' menggunakan metode 'execute' pada objek kursor '(self.cursor)'. Hasil dari query dieksekusi diambil menggunakan metode 'fetchall()' dan disimpan dalam variabel 'produk'. Setelah mendapatkan data produk, fungsi mencetak judul "Semua Produk:" ke layar. Fungsi menggunakan pustaka PrettyTable untuk membuat tabel yang rapi. Pertama, objek PrettyTable dibuat, kemudian kolom-kolom tabel ditentukan menggunakan 'field_names', yang mencakup ID produk, nama produk, keterangan produk, harga, dan ID franchise.
Untuk setiap entri produk dalam hasil query, baris baru ditambahkan ke tabel menggunakan 'add_row'. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

def tampilkan_semua_franchise(self):
            try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
            except mysql.connector.Error as err:
                print("Error:", err)

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor). Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise, fungsi mencetak judul "Semua Franchise:" ke layar. Fungsi menggunakan pustaka PrettyTable untuk membuat tabel yang rapi. Objek PrettyTable dibuat, dan kolom-kolom tabel ditentukan menggunakan field_names, yang mencakup ID franchise, nama franchise, lokasi franchise, deskripsi franchise, ID pemilik, dan status franchise. Untuk setiap entri franchise dalam hasil query, baris baru ditambahkan ke tabel menggunakan add_row. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. 


...

def tambah_produk(self):
        try:
            self.cursor.execute("SELECT * FROM produk_franchise")
            produk = self.cursor.fetchall()
            print("\nSemua Produk:")
            table = PrettyTable()
            table.field_names = ["ID Produk", "Nama Produk", "Keterangan Produk", "Harga", "ID Franchise"]
            for item in produk:
                table.add_row(item)
            print(table)
            nama_produk = input("Masukkan nama produk baru: ")
            keterangan_produk = input("Masukkan keterangan produk baru: ")
            harga_produk = input("Masukkan harga produk baru: ")
            id_franchise = input("Masukkan ID franchise untuk produk baru: ")
            id_produk = input("Masukkan ID produk: ")
            sql = "INSERT INTO produk_franchise (id_produk, nama_produk, keterangan_produk, harga_produk, id_franchise) VALUES (%s, %s, %s, %s, %s)"
            val = (id_produk, nama_produk, keterangan_produk, harga_produk, id_franchise)
            self.cursor.execute(sql, val)
            self.conn.commit()  # Commit perubahan ke database
            print("Produk baru berhasil ditambahkan.")
        except mysql.connector.Error as err:
            print("Error:", err)

...


Fungsi tambah_produk bertujuan untuk menambahkan produk baru ke dalam tabel produk_franchise. Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua produk yang sudah ada dari tabel produk_franchise menggunakan metode execute pada objek kursor (self.cursor). Setelah mendapatkan hasil query, semua produk tersebut ditampilkan dalam bentuk tabel yang terstruktur dengan menggunakan pustaka PrettyTable. Selanjutnya, fungsi meminta input dari admin untuk data produk baru yang akan ditambahkan. Admin diminta untuk memasukkan nama produk baru, keterangan produk, harga produk, ID franchise untuk produk baru, dan ID produk. Setelah mendapatkan input dari admin, fungsi mengeksekusi query SQL untuk menambahkan produk baru ke dalam tabel produk_franchise. Query ini menggunakan pernyataan INSERT INTO untuk memasukkan data produk baru sesuai dengan input yang diberikan oleh admin. Setelah mengeksekusi query, perubahan tersebut di-commit ke database dengan menggunakan self.conn.commit() untuk menyimpan perubahan secara permanen. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

  def perbarui_produk(self):
        self.connect_database()
        id_produk = input("Masukkan ID produk yang ingin diperbarui: ")
        nama_produk = input("Masukkan nama produk baru: ")
        harga_produk = int(input("Masukkan harga produk baru: "))
        keterangan_produk = input("Masukkan keterangan produk baru: ")
        try:
            sql = "UPDATE produk_franchise SET nama_produk = %s, harga_produk = %s, keterangan_produk = %s WHERE id_produk = %s"
            val = (nama_produk, harga_produk, keterangan_produk, id_produk)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Produk berhasil diperbarui!")
        except mysql.connector.Error as err:
            print("Error:", err)
        self.close_connection()

...

Fungsi perbarui_produk bertujuan untuk memperbarui data produk yang ada dalam tabel produk_franchise. Fungsi ini memulai dengan memanggil self.connect_database() untuk memastikan bahwa koneksi ke database sudah aktif. Kemudian, admin diminta untuk memasukkan ID produk yang ingin diperbarui. Setelah itu, admin diminta untuk memasukkan data baru untuk produk tersebut, seperti nama produk baru, harga produk baru, dan keterangan produk baru. Setelah mendapatkan input dari admin, fungsi mencoba mengeksekusi query SQL UPDATE untuk memperbarui data produk di database. Query tersebut mengganti nilai-nlai kolom nama_produk, harga_produk, dan keterangan_produk dengan nilai baru sesuai dengan ID produk yang diberikan. Setelah mengeksekusi query, perubahan tersebut di-commit ke database dengan menggunakan self.conn.commit() untuk menyimpan perubahan secara permanen. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.
erakhir, fungsi memanggil self.close_connection() untuk menutup koneksi ke database setelah proses perbarui selesai.


...

  def ubah_status(self):
        try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
        except mysql.connector.Error as err:
                print("Error:", err)
        self.connect_database()
        id_franchise = input("Masukkan ID franchise yang ingin diubah: ")
        try:
            # Periksa apakah franchise tersedia
            sql_check_franchise = "SELECT * FROM franchise WHERE id_franchise = %s"
            val_check_franchise = (id_franchise, )  # Pastikan ini berupa tuple
            self.cursor.execute(sql_check_franchise, val_check_franchise)
            result = self.cursor.fetchone()
            if result:
                sql_update_status = "UPDATE franchise SET status = 'belum' WHERE id_franchise = %s"
                self.cursor.execute(sql_update_status, (id_franchise,))
                self.conn.commit() 
                print("Franchise berhasil diubah")
            else:
                print("Franchise dengan ID tersebut tidak ditemukan.")
        except mysql.connector.Error as err:
            print("Error:", err)
            self.close_connection()

...

Fungsi ubah_status bertujuan untuk mengubah status franchise dalam tabel franchise menjadi "belum". Fungsi ini pertama-tama mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor).
Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise, semua informasi franchise tersebut ditampilkan dalam bentuk tabel yang terstruktur menggunakan pustaka PrettyTable. Setelah menampilkan semua franchise, fungsi meminta input dari admin untuk memasukkan ID franchise yang ingin diubah statusnya. Kemudian, fungsi mencoba mengeksekusi query SQL untuk memeriksa apakah franchise dengan ID yang diberikan oleh admin tersedia dalam database. Jika franchise ditemukan, fungsi mengubah statusnya menjadi "belum" dengan mengeksekusi query SQL UPDATE. Perubahan tersebut kemudian di-commit ke database. Jika franchise tidak ditemukan, pesan "Franchise dengan ID tersebut tidak ditemukan." akan dicetak. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah selesai melakukan semua operasi, fungsi memanggil self.close_connection() untuk menutup koneksi ke database.


...

def tambah_franchise(self):
        try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
        except mysql.connector.Error as err:
                print("Error:", err)
        self.connect_database()
        id_franchise = input("Masukkan ID franchise: ")
        nama_franchise = input("Masukkan nama franchise: ")
        lokasi_franchise = input("Masukkan lokasi franchise: ")
        deskripsi_franchise = input("Masukkan Keterangan dari franchise: ")
        id_pemilik = input("Masukkan ID pemilik dengan benar!: ")
        try:
            sql = "INSERT INTO franchise ( id_franchise, nama_franchise, lokasi_franchise, deskripsi_franchise, id_pemilik) VALUES (%s, %s, %s, %s, %s)"
            val = (id_franchise, nama_franchise, lokasi_franchise, deskripsi_franchise, id_pemilik)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Franchise berhasil ditambahkan!")
        except mysql.connector.Error as err:
            print("Error:", err)
        self.close_connection()

...

Fungsi tambah_franchise bertujuan untuk menambahkan data franchise baru ke dalam tabel franchise. Fungsi ini pertama-tama mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor).
Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise, semua informasi franchise tersebut ditampilkan dalam bentuk tabel yang terstruktur menggunakan pustaka PrettyTable. Kemudian, fungsi meminta input dari admin untuk memasukkan data franchise baru, seperti ID franchise, nama franchise, lokasi franchise, deskripsi franchise, dan ID pemilik. Setelah mendapatkan input dari admin, fungsi mencoba mengeksekusi query SQL untuk menambahkan data franchise baru ke dalam tabel franchise. Query ini menggunakan pernyataan INSERT INTO untuk memasukkan data baru sesuai dengan input yang diberikan oleh admin. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah selesai melakukan semua operasi, fungsi memanggil self.close_connection() untuk menutup koneksi ke database.


...

def perbarui_franchise(self):
        try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
        except mysql.connector.Error as err:
                print("Error:", err)
        self.connect_database()
        id_franchise = input("Masukkan ID franchise yang ingin diperbarui: ")
        nama_franchise = input("Masukkan nama franchise baru: ")
        lokasi = input("Masukkan lokasi franchise baru: ")
        keterangan_franchise = input("Masukkan keterangan franchise baru: ")
        id_pemilik = input("Masukkan ID Pemilik Yang baru: ")
        try:
            sql = "UPDATE franchise SET nama_franchise = %s, lokasi = %s, keterangan_franchise = %s, id_pemilik = %s WHERE id_franchise = %s"
            val = (nama_franchise, lokasi, keterangan_franchise, id_pemilik, id_franchise)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Franchise berhasil diperbarui!")
        except mysql.connector.Error as err:
            print("Error:", err)

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor). Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise, semua informasi franchise tersebut ditampilkan dalam bentuk tabel yang terstruktur menggunakan pustaka PrettyTable. Setelah menampilkan semua franchise, fungsi meminta input dari admin untuk memasukkan ID franchise yang ingin diperbarui, serta data baru untuk franchise tersebut seperti nama franchise baru, lokasi franchise baru, keterangan franchise baru, dan ID pemilik baru. Setelah mendapatkan input dari admin, fungsi mencoba mengeksekusi query SQL UPDATE untuk memperbarui data franchise di database. Query ini menggunakan pernyataan UPDATE untuk mengubah nilai kolom nama_franchise, lokasi_franchise, keterangan_franchise, dan id_pemilik sesuai dengan nilai yang baru sesuai input admin, berdasarkan ID franchise yang diberikan. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah selesai melakukan semua operasi, fungsi memanggil self.close_connection() untuk menutup koneksi ke database.


...

def hapus_produk(self):
        try:
            self.cursor.execute("SELECT * FROM produk_franchise")
            produk = self.cursor.fetchall()
            print("\nSemua Produk:")
            # Membuat objek PrettyTable
            table = PrettyTable()
            # Menambahkan kolom
            table.field_names = ["ID Produk", "Nama Produk", "Keterangan Produk", "Harga", "ID Franchise"]
            # Menambahkan baris untuk setiap entri produk
            for item in produk:
                table.add_row(item)
            print(table)
        except mysql.connector.Error as err:
            print("Error:", err)
        self.connect_database()
        id_produk = input("Masukkan ID produk yang ingin dihapus: ")
        try:
            sql = "DELETE FROM produk_franchise WHERE id_produk = %s"
            val = (id_produk,)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Produk berhasil dihapus!")
        except mysql.connector.Error as err:
            print("Error:", err)
        self.close_connection()

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data produk dari tabel produk_franchise menggunakan metode execute pada objek kursor (self.cursor). Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel produk. Setelah mendapatkan data produk, semua informasi produk tersebut ditampilkan dalam bentuk tabel yang terstruktur menggunakan pustaka PrettyTable. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah menampilkan semua produk, fungsi meminta input dari admin untuk memasukkan ID produk yang ingin dihapus. Setelah mendapatkan input ID produk, fungsi mencoba mengeksekusi query SQL DELETE untuk menghapus produk dari tabel produk_franchise berdasarkan ID produk yang diberikan. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah selesai melakukan semua operasi, fungsi memanggil self.close_connection() untuk menutup koneksi ke database.


...

def hapus_franchise(self):           
        try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
        except mysql.connector.Error as err:
                print("Error:", err)        
        self.connect_database()
        id_franchise = input("Masukkan ID franchise yang ingin dihapus: ")
        try:
            sql = "DELETE FROM franchise WHERE id_franchise = %s"
            val = (id_franchise,)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Franchise berhasil dihapus!")
        except mysql.connector.Error as err:
            print("Error:", err)
        self.close_connection()

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor). Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise, semua informasi franchise tersebut ditampilkan dalam bentuk tabel yang terstruktur menggunakan pustaka PrettyTable. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah menampilkan semua franchise, fungsi meminta input dari admin untuk memasukkan ID franchise yang ingin dihapus. Setelah mendapatkan input ID franchise, fungsi mencoba mengeksekusi query SQL DELETE untuk menghapus franchise dari tabel franchise berdasarkan ID franchise yang diberikan. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar. Setelah selesai melakukan semua operasi, fungsi memanggil self.close_connection() untuk menutup koneksi ke database.


...

  def menu_admin(self):
        while True:
            print("\nMenu Utama:")
            print("1. Tampilkan Semua Produk")
            print("2. Tampilkan Semua Franchise")
            print("3. Tambah Produk")
            print("4. Tambah Franchise")
            print("5. Perbarui Produk")
            print("6. Perbarui Franchise")
            print("7. Hapus Produk")
            print("8. Hapus Franchise")
            print("9. Ubah Status")
            print("10. Keluar")
            pilihan = input("Masukkan pilihan Anda: ")
            if pilihan == '1':
                self.tampilkan_semua_produk()
            elif pilihan == '2':
                self.tampilkan_semua_franchise()
            elif pilihan == '3':
                self.tambah_produk()
            elif pilihan == '4':
                self.tambah_franchise()
            elif pilihan == '5':
                self.perbarui_produk()
            elif pilihan == '6':
                self.perbarui_franchise()
            elif pilihan == '7':
                self.hapus_produk()
            elif pilihan == '8':
                self.hapus_franchise()
            elif pilihan == '9':
                self.ubah_status()
            elif pilihan == '10':
                print("Keluar dari program...")
                break

...

Fungsi ini menggunakan sebuah loop while True sehingga menu akan terus ditampilkan sampai admin memilih untuk keluar. Di dalam loop, menu utama ditampilkan dengan daftar opsi, seperti menampilkan semua produk, semua franchise, menambah produk, menambah franchise, memperbarui produk, memperbarui franchise, menghapus produk, menghapus franchise, mengubah status, dan keluar dari program. Admin diminta untuk memasukkan pilihan dengan menggunakan fungsi input(). 
Berdasarkan pilihan yang dimasukkan oleh admin, fungsi akan memanggil fungsi yang sesuai untuk menangani operasi yang dipilih. Jika admin memilih untuk keluar (pilihan '10'), pesan "Keluar dari program..." akan dicetak, dan loop akan dihentikan dengan menggunakan break.


...

def login(self):
        nama_pedagang = input("Masukkan Nama User: ")
        password = input("Masukkan Password: ")
        self.cursor = self.conn.cursor()
        sql = "SELECT * FROM pedagang WHERE nama_pedagang = %s AND password = %s"
        val = (nama_pedagang, password)
        self.cursor.execute(sql, val)
        result = self.cursor.fetchone()
        if result:
            print("Login berhasil sebagai user.")
            return True
        else:
            print("Login gagal. Nama user atau password salah.")
            coba_lagi = input("Coba lagi? (y/n): ")
            if coba_lagi.lower() != 'y':
                return False

...

Admin diminta untuk memasukkan nama pengguna (nama pedagang) dan kata sandi melalui fungsi input(). Setelah mendapatkan input, fungsi membuat objek kursor dengan menggunakan self.conn.cursor(). Fungsi kemudian menjalankan query SQL untuk memeriksa apakah ada entri dalam tabel pedagang yang sesuai dengan nama pengguna dan kata sandi yang dimasukkan oleh admin. Hasil query dieksekusi diambil menggunakan fetchone() dan disimpan dalam variabel result. Jika hasil ditemukan (berarti ada baris dalam tabel yang sesuai dengan kriteria pencarian), pesan "Login berhasil sebagai user." akan dicetak, dan fungsi akan mengembalikan nilai True untuk menunjukkan bahwa proses login berhasil. Jika hasil tidak ditemukan (berarti tidak ada baris dalam tabel yang sesuai dengan kriteria pencarian), pesan "Login gagal. Nama user atau password salah." akan dicetak. Admin akan ditanya apakah ingin mencoba lagi. Jika tidak, fungsi akan mengembalikan nilai False untuk menunjukkan bahwa proses login gagal.


...


def nyewa_franchise(self):
        self.connect_database()
        try:
                self.cursor.execute("SELECT * FROM franchise")
                franchises = self.cursor.fetchall()
                print("\nSemua Franchise:")
                # Membuat objek PrettyTable
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                    table.add_row(franchise)
                print(table)
        except mysql.connector.Error as err:
                print("Error:", err)
        try:
            id_franchise = input("Masukkan ID franchise yang ingin disewa: ")
            sql_check_franchise = "SELECT * FROM franchise WHERE id_franchise = %s AND status = 'belum'"
            val_check_franchise = (id_franchise, )
            self.cursor.execute(sql_check_franchise, val_check_franchise)
            result = self.cursor.fetchone()
            if result:
                # Jika franchise tersedia dan belum disewa, lakukan penyewaan
                sql_update_status = "UPDATE franchise SET status = 'sudah' WHERE id_franchise = %s"
                val_update_status = (id_franchise, )
                self.cursor.execute(sql_update_status, val_update_status)
                self.conn.commit()
                print("Franchise berhasil disewa!")
            else:
                # Jika franchise sudah disewa, beri tahu user
                print("Franchise dengan ID tersebut sudah tidak tersedia untuk disewa.")
        except mysql.connector.Error as err:
            print("Error:", err)
            self.close_connection()

...

Fungsi ini pertama-tama memanggil metode self.connect_database() untuk memastikan koneksi ke database aktif. Kemudian, fungsi mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise menggunakan metode execute pada objek kursor (self.cursor). Jika berhasil, data franchise diambil dan ditampilkan dalam bentuk tabel menggunakan pustaka PrettyTable. Setelah menampilkan semua franchise yang tersedia, fungsi meminta input dari pedagang untuk memasukkan ID franchise yang ingin disewa. Selanjutnya, fungsi menjalankan query SQL untuk memeriksa apakah franchise dengan ID yang dimasukkan tersedia dan belum disewa. Query tersebut memeriksa status franchise dalam database. Jika ditemukan franchise yang sesuai, statusnya akan diubah menjadi "sudah" yang menunjukkan bahwa franchise tersebut telah disewa. Jika franchise tersedia dan belum disewa, statusnya diubah dan perubahan tersebut di-commit ke database. Pesan "Franchise berhasil disewa!" akan dicetak. Jika franchise sudah disewa sebelumnya, pesan "Franchise dengan ID tersebut sudah tidak tersedia untuk disewa." akan dicetak. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak, dan koneksi ke database akan ditutup.


...

 def sorting_ascending(self):
        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY nama_franchise ASC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara ascending berdasarkan nama:")
            for franchise in franchises:
                print(franchise)
        except mysql.connector.Error as err:
            print("Error:", err)

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise dan mengurutkannya secara ascending (menaik) berdasarkan kolom nama_franchise. Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise yang sudah diurutkan, setiap entri franchise dicetak secara langsung ke layar. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

def sorting_descending(self):
        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY nama_franchise DESC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara descending berdasarkan nama:")
            for franchise in franchises:
                print(franchise)
        except mysql.connector.Error as err:
            print("Error:", err)

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise dan mengurutkannya secara descending (menurun) berdasarkan kolom nama_franchise. 
Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise yang sudah diurutkan, setiap entri franchise dicetak ke layar. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

def sorting_descendingid(self):
        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY id_franchise DESC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara descending berdasarkan ID:")
            for franchise in franchises:
                print(franchise)
        except mysql.connector.Error as err:
         print("Error:", err)4

...

Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise dan mengurutkannya secara descending (menurun) berdasarkan kolom id_franchise. Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Setelah mendapatkan data franchise yang sudah diurutkan, setiap entri franchise dicetak ke layar. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

def searching_nama(self):
        keyword = input("Masukkan nama yang ingin dicari: ")
        try:
            sql = "SELECT * FROM franchise WHERE nama_franchise LIKE %s"
            val = ("%" + keyword + "%",)
            self.cursor.execute(sql, val)
            franchises = self.cursor.fetchall()
            if franchises:
                print("\nHasil pencarian:")
                for franchise in franchises:
                    print(franchise)
            else:
                print("Tidak ada franchise yang cocok dengan nama tersebut.")
        except mysql.connector.Error as err:
            print("Error:", err)

...

Pengguna diminta untuk memasukkan nama yang ingin dicari melalui fungsi input() dan disimpan dalam variabel keyword. Fungsi ini mencoba mengeksekusi query SQL untuk mengambil semua data franchise dari tabel franchise di mana nama franchise cocok dengan kata kunci yang dimasukkan pengguna. Query ini menggunakan operator LIKE untuk mencocokkan nama franchise yang mengandung kata kunci yang dimasukkan pengguna. Kata kunci yang dimasukkan pengguna dimasukkan ke dalam query dengan menambahkan wildcard % di depan dan di belakang kata kunci untuk mencocokkan nama franchise yang mengandung kata kunci tersebut. Hasil query dieksekusi diambil menggunakan metode fetchall() dan disimpan dalam variabel franchises. Jika ditemukan franchise yang cocok dengan nama yang dicari, hasil pencarian akan dicetak ke layar. Jika terjadi kesalahan saat menjalankan query SQL (ditangkap oleh blok except), pesan kesalahan akan dicetak ke layar.


...

def searching_id(self):
        id_franchise = input("Masukkan ID franchise yang ingin dicari: ")
        try:
            sql = "SELECT * FROM franchise WHERE id_franchise = %s"
            val = (id_franchise,)
            self.cursor.execute(sql, val)
            franchise = self.cursor.fetchone()
            if franchise:
                print("\nHasil pencarian:")
                print(franchise)
            else:
                print("Franchise dengan ID tersebut tidak ditemukan.")
        except mysql.connector.Error as err:
            print("Error:", err)

...

Pengguna diminta untuk memasukkan ID franchise yang ingin dicari melalui perintah input("Masukkan ID franchise yang ingin dicari: "). Nilai yang dimasukkan kemudian disimpan dalam variabel id_franchise. Fungsi ini menggunakan parameterized query SQL untuk mencari ID franchise yang sesuai dengan input pengguna. Query SQL tersebut adalah "SELECT * FROM franchise WHERE id_franchise = %s". %s adalah placeholder yang akan digantikan oleh nilai ID franchise yang dimasukkan pengguna. Query SQL dieksekusi dengan menggunakan metode execute dari objek kursor database. Query dieksekusi dengan menyediakan nilai ID franchise yang dimasukkan oleh pengguna sebagai argumen. Eksekusi query dapat menghasilkan satu baris data yang sesuai dengan kriteria pencarian. Hasil dari eksekusi query diekstrak menggunakan metode fetchone dari objek kursor. Jika sebuah baris data ditemukan yang sesuai dengan ID franchise yang dimasukkan pengguna, maka baris data tersebut disimpan dalam variabel franchise. Jika tidak ada baris data yang ditemukan, nilai franchise akan menjadi None. Jika franchise tidak kosong (berisi data), maka program mencetak pesan "Hasil pencarian:" diikuti oleh mencetak nilai franchise, yang berisi informasi tentang franchise yang ditemukan. Jika franchise kosong (bernilai None), program mencetak pesan "Franchise dengan ID tersebut tidak ditemukan.". Sebuah blok try-except digunakan untuk menangani kesalahan yang mungkin terjadi selama eksekusi query. Jika terjadi kesalahan, pesan kesalahan akan dicetak.


...

   def menu_user(self):
        while True:
            print("1. Tampilkan Franchise")
            print("2. Nyewa Franchise")
            print("3. Sorting Secara Ascending Nama")
            print("4. Sorting Secara Descending Nama")
            print("5. Sorting Secara Descending ID")
            print("6. Searching")
            print("7. Keluar")
            pilihan = input("Masukkan Pilihan: ")
            if pilihan == '1':
                self.tampilkan_semua_franchise()
            elif pilihan == '2':
                self.nyewa_franchise()
            elif pilihan == '3':
                self.sorting_ascending()
            elif pilihan == '4':
                self.sorting_descending()
            elif pilihan == '5':
                self.sorting_descendingid()
            elif pilihan == '7':
                print("Keluar dari program")
                break
            elif pilihan == '6':
                print("1. Berdasarkan nama")
                print("2. Berdasarkan ID")
                print("3. Kembali")
                choice = input("Pilih: ")
                if choice == '1':
                    self.searching_nama()
                elif choice == '2':
                    self.searching_id()
                elif choice == '3':
                    return
            else:
                print("Pilihan tidak ada")
                return self.menu_user()


...

Program ini berjalan dalam loop while True, yang berarti akan terus berjalan sampai ada perintah untuk keluar. Program mencetak menu pilihan kepada pengguna menggunakan perintah print. Opsi-opsi ini mencakup tampilan daftar franchise, menyewa franchise, melakukan sorting (pengurutan) berdasarkan nama dan ID, melakukan pencarian, dan keluar dari program. Pengguna diminta untuk memilih opsi yang diinginkan melalui perintah input("Masukkan Pilihan: "). Nilai yang dimasukkan disimpan dalam variabel pilihan.  Jika pilihan adalah '1', program akan memanggil metode tampilkan_semua_franchise().
Jika pilihan adalah '2', program akan memanggil metode nyewa_franchise().
Jika pilihan adalah '3', program akan memanggil metode sorting_ascending().
Jika pilihan adalah '4', program akan memanggil metode sorting_descending().
Jika pilihan adalah '5', program akan memanggil metode sorting_descendingid().
Jika pilihan adalah '7', program akan mencetak pesan "Keluar dari program" dan keluar dari loop menggunakan break.
Jika pilihan adalah '6', program akan mencetak sub-menu pencarian, yang meminta pengguna untuk memilih kriteria pencarian berdasarkan nama atau ID. Bergantung pada pilihan pengguna, program akan memanggil metode searching_nama() atau searching_id(), atau kembali ke menu utama jika pengguna memilih '3'.  Jika pengguna memasukkan pilihan yang tidak valid (misalnya, tidak ada di menu), program akan mencetak pesan "Pilihan tidak ada" dan kemudian memanggil kembali fungsi menu_user() untuk meminta input lagi.


...

def utama(admin):
    user = User(admin.conn) 
    while True:
        print("==== SELAMAT DATANG ====")
        print("\nMenu Utama:")
        print("1. Admin")
        print("2. User")
        print("3. Keluar")
        choice = input("Masukkan pilihan: ")
        if choice == "1":
            if admin.login():
                admin.menu_admin()
        elif choice == "2":
            if user.login():
                user.menu_user()
        elif choice == "3":
            print("Program selesai.")
            break
        else:
            print("Pilihan tidak valid. Silakan coba lagi.")

...

Program mencetak menu utama yang meminta pengguna untuk memilih apakah mereka ingin masuk sebagai admin, masuk sebagai pengguna biasa, atau keluar dari program. Pilihan pengguna disimpan dalam variabel choice. Jika pilihan adalah "1", program memeriksa apakah admin berhasil masuk menggunakan fungsi admin.login(). Jika ya, menu admin ditampilkan dengan memanggil metode admin.menu_admin().
Jika pilihan adalah "2", program memeriksa apakah pengguna berhasil masuk menggunakan fungsi user.login(). Jika ya, menu pengguna ditampilkan dengan memanggil metode user.menu_user().
Jika pilihan adalah "3", program mencetak pesan "Program selesai." dan keluar dari loop menggunakan break.
Jika pilihan tidak valid, program mencetak pesan "Pilihan tidak valid. Silakan coba lagi.".
Program berjalan dalam loop while True, yang berarti akan terus berjalan sampai pengguna memilih untuk keluar dari program.


...

def main():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="kemitraan"
    )
    admin = Admin(conn)
    if admin.conn:
        utama(admin)
        admin.close_connection()
    else:
        print("Koneksi ke database gagal")


if __name__ == "__main__":
    main()

...

Fungsi main pertama-tama menciptakan koneksi ke database MySQL dengan menggunakan modul mysql.connector. Informasi koneksi seperti host, nama pengguna, kata sandi, dan nama database disediakan dalam parameter fungsi connect. Setelah koneksi berhasil dibuat, objek Admin dibuat dengan menggunakan koneksi database yang telah dibuat sebelumnya. Setelah koneksi berhasil dibuat, objek Admin dibuat dengan menggunakan koneksi database yang telah dibuat sebelumnya. 
Fungsi main memanggil fungsi utama(admin) untuk menampilkan menu utama kepada pengguna, dimana pengguna dapat memilih apakah ingin masuk sebagai admin atau pengguna biasa. Setelah pengguna keluar dari program, koneksi database ditutup dengan memanggil metode close_connection() dari objek Admin.  Jika koneksi ke database gagal, program mencetak pesan "Koneksi ke database gagal". Pada akhirnya, fungsi main dipanggil pada blok if __name__ == "__main__" untuk memulai eksekusi program saat file dieksekusi sebagai skrip utama.


#Cara Penggunaan#

- ![Screenshot 2024-05-01 203711](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/a64292a5-f80e-425c-8778-3f7bda3609ef)
Jika kita memilih menu admin, kita memerlukan login nama admin dan password yang tertera di database admin. setelah login akan diberikan beberapa opsi

-  ![Screenshot 2024-05-01 203938](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/98b0da94-dba7-435f-8df5-ad5154b017b3)
Jika kita memilih opsi 1, akan menampilkan semua produk yang ada

![Screenshot 2024-05-01 204002](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/4435a2c3-ad9c-4c43-8e5d-e5de4c149e56)
Jika memilih opsi 2, akan menampilkan semua franchise

![Screenshot 2024-05-01 204116](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/ffb17435-3187-47f5-9aa6-d7ee5c0d274e)
Untuk opsi 3, akan menampilkan input nama produk baru, keterangan produk baru, harga produk baru, id_franchise baru ( harus yang ada di dalam database id_franchise) dan masukkan id_produk

![Screenshot 2024-05-01 204357](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/165df6a8-2fa4-4a3a-a8b0-8b2df616f8df)
Opsi 4, akan menampilkan inputan id_franchise yang baru(tidak ada di daftar id_franchise), nama franchise, lokasi, keterangan dari franchise, id pemilik(yang sudah ada)

![Screenshot 2024-05-01 204439](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/fb798ce7-2489-47c5-bc80-097a4a58cbbf)
Opsi 5, akan menampilkan innputan id_produk yang ingin diperbarui, nama produk baru, harga produk baru, keterangan produk baru

![Screenshot 2024-05-01 205136](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/c0ff1390-45fa-4845-917b-0d3e6ae78e42)
Opsi 6, akan meminta kita untuk memasukkan id franchise yang ingin diperbarui, masukkan nama franchise baru, lokasi franchise, keterangan franchise, dan id pemilik yang baru

![Screenshot 2024-05-01 205151](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/39382a7d-ce93-4c86-ade2-afe4480c298d)
Opsi 7, untuk menghapus produk yang ada di daftar produk franchise

![Screenshot 2024-05-01 205221](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/a892893c-9d6f-4e39-b386-6d8cfabd6590)
Opsi 8, untuk mengahpus franchise yang ada di daftar franchise

![Screenshot 2024-05-01 205257](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/ecd051be-8a39-485a-bc4c-282b39f91cce)
Opsi 9, untuk mengubah dari yang berstatus 'sudah' menjadi belum dengan memasukkan id franchise

![Screenshot 2024-05-01 211004](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/18051a2e-6108-4914-9e2b-480b87d27264)
untuk menuju menu user, kita harus menginput nama dan password user yang berasal dari id_pedagang setelah itu akan menampilkan beberapa opsi

![Screenshot 2024-05-01 211023](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/6e2debd9-fdc0-4e63-ab75-ec7a23079113)
Jika memilih opsi 2, akan menampilkan id franchise yang ingin disewa, jika sudah disewa otomatis id_franchise status akan berubah menjadi "sudah"

![Screenshot 2024-05-01 211551](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/8fd88b56-d0db-4f1c-b521-b1c4ca3e643e)
jika memilih ascending secara nama akan menampilkan ini

![Screenshot 2024-05-01 211626](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/51e3dfbf-9ea2-4291-8454-a34fbdfb7728)
jika memilih opsi descending secara nama akan menampilkan seperti ini

![Screenshot 2024-05-01 211646](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/a45ef50b-a12a-4f5c-94b8-c6a224777879)
jika memilih opsi descending secara id akan menampilkan seperti ini

![Screenshot 2024-05-01 211711](https://github.com/Azrieladiputra/PA-B23-KELOMPOK10/assets/144753236/48b12638-8342-4c16-9dbc-596abb1786a0)
jika melakukan seraching akan disuruh untuk menginput nama franchise setelah itu akan ditampilkan










































  

























































