import mysql.connector
from prettytable import PrettyTable

class Admin:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = None

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

    def close_connection(self):
        if self.conn:
            self.conn.close()
            print("Koneksi ditutup.")

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
                print("Keluar dari program...")
                break

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

            # Meminta input untuk data produk baru
            nama_produk = input("Masukkan nama produk baru: ")
            keterangan_produk = input("Masukkan keterangan produk baru: ")
            harga_produk = input("Masukkan harga produk baru: ")
            id_franchise = input("Masukkan ID franchise untuk produk baru: ")
            id_produk = input("Masukkan ID produk: ")

            # Eksekusi query untuk menambahkan produk baru ke dalam tabel
            sql = "INSERT INTO produk_franchise (id_produk, nama_produk, keterangan_produk, harga_produk, id_franchise) VALUES (%s, %s, %s, %s, %s)"
            val = (id_produk, nama_produk, keterangan_produk, harga_produk, id_franchise)
            self.cursor.execute(sql, val)
            self.conn.commit()  # Commit perubahan ke database
            print("Produk baru berhasil ditambahkan.")

        except mysql.connector.Error as err:
            print("Error:", err)


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

    def perbarui_produk(self):
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
        lokasi_franchise = input("Masukkan lokasi franchise baru: ")
        deskripsi_franchise = input("Masukkan keterangan franchise baru: ")
        id_pemilik = input("Masukkan ID Pemilik Yang baru: ")

        try:
            sql = "UPDATE franchise SET nama_franchise = %s, lokasi_franchise = %s, deskripsi_franchise = %s, id_pemilik = %s WHERE id_franchise = %s"
            val = (nama_franchise, lokasi_franchise, deskripsi_franchise, id_pemilik, id_franchise)
            self.cursor.execute(sql, val)
            self.conn.commit()
            print("Franchise berhasil diperbarui!")
        except mysql.connector.Error as err:
            print("Error:", err)

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


class User:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = None

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

    def close_connection(self):
        if self.conn:
            self.conn.close()
            print("Koneksi ditutup.")

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



    def sorting_ascending(self):
        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY nama_franchise ASC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara ascending berdasarkan nama:")

            table = PrettyTable()
                # Menambahkan kolom
            table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
            for franchise in franchises:
                    table.add_row(franchise)
            print(table)
        except mysql.connector.Error as err:
            print("Error:", err)
    
    def sorting_descending(self):

        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY nama_franchise DESC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara descending berdasarkan nama:")
            table = PrettyTable()
                # Menambahkan kolom
            table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
            for franchise in franchises:
                    table.add_row(franchise)
            print(table)
        except mysql.connector.Error as err:
            print("Error:", err)

    def sorting_descendingid(self):
        try:
            self.cursor.execute("SELECT * FROM franchise ORDER BY id_franchise DESC")
            franchises = self.cursor.fetchall()
            print("\nFranchise diurutkan secara descending berdasarkan ID:")
            table = PrettyTable()
                # Menambahkan kolom
            table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                # Menambahkan baris untuk setiap entri franchise
            for franchise in franchises:
                    table.add_row(franchise)
            print(table)
        except mysql.connector.Error as err:
         print("Error:", err)



    def searching_nama(self):
        keyword = input("Masukkan nama yang ingin dicari: ")
        try:
            sql = "SELECT * FROM franchise WHERE nama_franchise LIKE %s"
            val = ("%" + keyword + "%",)
            self.cursor.execute(sql, val)
            franchises = self.cursor.fetchall()
            if franchises:
                print("\nHasil pencarian:")
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                    # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                        table.add_row(franchise)
                print(table)
            else:
                print("Tidak ada franchise yang cocok dengan nama tersebut.")
        except mysql.connector.Error as err:
            print("Error:", err)

    def searching_id(self):
        id_franchise = input("Masukkan ID franchise yang ingin dicari: ")
        try:
            sql = "SELECT * FROM franchise WHERE id_franchise = %s"
            val = ("%" + id_franchise + "%")
            self.cursor.execute(sql, val)
            franchises = self.cursor.fetchone()
            if franchises :
                print("\nHasil pencarian:")
                table = PrettyTable()
                # Menambahkan kolom
                table.field_names = ["ID Franchise", "Nama Franchise", "Lokasi Franchise", "Deskripsi Franchise", "ID Pemilik", "Status"]
                    # Menambahkan baris untuk setiap entri franchise
                for franchise in franchises:
                        table.add_row(franchise)
                print(table)
            else:
                print("Franchise dengan ID tersebut tidak ditemukan.")
        except mysql.connector.Error as err:
            print("Error:", err)

             
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
