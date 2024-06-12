import 'package:flutter/material.dart';

class PickUpScreen extends StatefulWidget {
  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  String selectedOption = 'Default Option'; // Inisialisasi pilihan default
  bool isOptionsVisible = false; // Menandakan apakah opsi sedang ditampilkan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(94, 119, 216, 1),
                Color.fromRGBO(48, 133, 195, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Text('Pickup Sampah'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100, // Sesuaikan dengan tinggi background yang diinginkan
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background pickup.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Jenis Sampah',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pilih Jenis Sampah',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Warna isi kotak teks
                        prefixIcon: Image.asset(
                          'assets/icons/iconSampah.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ), // Icon di pojok kiri
                        suffixIcon: IconButton(
                          // Icon di pojok kanan
                          icon: isOptionsVisible
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(Icons.arrow_right),
                          onPressed: () {
                            // Toggle untuk menampilkan/sembunyikan opsi
                            setState(() {
                              isOptionsVisible = !isOptionsVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  // Menampilkan opsi jika isOptionsVisible bernilai true
                  if (isOptionsVisible) ...[
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(160, 217, 149, 1)),
                        child: Image.asset(
                          'assets/icons/iconKardus.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Kardus'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 1';
                        });
                      },
                    ),
                    Divider(), // Garis di antara opsi
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(210, 231, 234,
                              1), // Warna latar belakang lingkaran
                        ),
                        child: Image.asset(
                          'assets/icons/iconBotolPlastik.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Botol Plastik'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 2';
                        });
                      },
                    ),
                    Divider(), // Garis di antara opsi
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(108, 196, 161,
                              1), // Warna latar belakang lingkaran
                        ),
                        child: Image.asset(
                          'assets/icons/iconBotolKaca.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Botol Kaca'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 3';
                        });
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(80, 217, 192,
                              1), // Warna latar belakang lingkaran
                        ),
                        child: Image.asset(
                          'assets/icons/iconKertas.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Kertas'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 4';
                        });
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(237, 164, 255,
                              1), // Warna latar belakang lingkaran
                        ),
                        child: Image.asset(
                          'assets/icons/iconBotolSkincare.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Botol Skincare'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 5';
                        });
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              221, 44, 44, 1), // Warna latar belakang lingkaran
                        ),
                        child: Image.asset(
                          'assets/icons/iconKaleng.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ),
                      ),
                      title: Text('Botol Kaleng'),
                      onTap: () {
                        // Logika ketika opsi dipilih
                        setState(() {
                          selectedOption = 'Option 6';
                        });
                      },
                    ),
                    Divider(),

                    // Tambahkan opsi lainnya sesuai kebutuhan
                  ],
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Lokasi Pengambilan',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tentukan Lokasimu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Warna isi kotak teks
                        prefixIcon: Image.asset(
                          'assets/icons/iconLokasi.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ), // Icon di pojok kiri
                        // suffixIcon: IconButton(
                        //   // Icon di pojok kanan
                        //   icon: isOptionsVisible
                        //       ? Icon(Icons.arrow_drop_down)
                        //       : Icon(Icons.arrow_right),
                        //   onPressed: () {
                        //     // Toggle untuk menampilkan/sembunyikan opsi
                        //     setState(() {
                        //       isOptionsVisible = !isOptionsVisible;
                        //     });
                        //   },
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Waktu Pengembalian',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Sesuaikan Waktumu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Warna isi kotak teks
                        prefixIcon: Image.asset(
                          'assets/icons/iconJam.png', // Path ke gambar ikon
                          width: 24, // Sesuaikan ukuran ikon
                          height: 24,
                        ), // Icon di pojok kiri
                        // suffixIcon: IconButton(
                        //   // Icon di pojok kanan
                        //   icon: isOptionsVisible
                        //       ? Icon(Icons.arrow_drop_down)
                        //       : Icon(Icons.arrow_right),
                        //   onPressed: () {
                        //     // Toggle untuk menampilkan/sembunyikan opsi
                        //     setState(() {
                        //       isOptionsVisible = !isOptionsVisible;
                        //     });
                        //   },
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logic for 'Oke' button
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(48, 133, 195, 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Oke',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    // Add logic to show more options here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('More Options'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  title: Text('Option 1'),
                  onTap: () {
                    // Logika ketika opsi dipilih
                    setState(() {
                      selectedOption = 'Option 1';
                    });
                    Navigator.pop(context); // Tutup menu
                  },
                ),
                ListTile(
                  title: Text('Option 2'),
                  onTap: () {
                    // Logika ketika opsi dipilih
                    setState(() {
                      selectedOption = 'Option 2';
                    });
                    Navigator.pop(context); // Tutup menu
                  },
                ),
                // Tambahkan opsi lainnya sesuai kebutuhan
              ],
            ),
          ),
        );
      },
    );
  }
}
