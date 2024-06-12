import 'package:flutter/material.dart';
import 'article_detail_screen.dart';
import 'package:jecle/views/isu_sampah_screen.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String selectedButton = 'Artikel';

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
        title: Text('Article'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButton = 'Artikel';
                  });
                  // Navigasi ke halaman Artikel
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    selectedButton == 'Artikel'
                        ? Color.fromRGBO(48, 133, 195, 1)
                        : Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Artikel',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButton = 'Isu Sampah';
                  });
                  // Navigasi ke halaman Isu Sampah
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IsuSampahScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    selectedButton == 'Isu Sampah'
                        ? Color.fromRGBO(48, 133, 195, 1)
                        : Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Isu Sampah',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          title: 'Daur ulang adalah masa depan',
                          content:
                              'Daur ulang adalah proses mengubah limbah menjadi bahan baru yang dapat digunakan kembali. Ini merupakan langkah penting dalam upaya menjaga lingkungan hidup kita dari kerusakan yang lebih parah. Dengan daur ulang, kita bisa mengurangi jumlah limbah yang berakhir di tempat pembuangan akhir, menghemat sumber daya alam, dan mengurangi polusi.\n\n'
                              'Salah satu manfaat utama dari daur ulang adalah penghematan energi. Proses produksi barang dari bahan daur ulang biasanya memerlukan lebih sedikit energi dibandingkan dengan menggunakan bahan mentah. Misalnya, mendaur ulang aluminium bisa menghemat hingga 95% energi dibandingkan dengan memproduksi aluminium baru dari bijih bauksit.',
                          imageUrl: 'assets/images/artikel sampah 1.png',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/artikel sampah 1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Daur ulang adalah masa depan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          title: 'Bagaimana cara mendaur ulang secara efisien',
                          content:
                              '1. Pisahkan Limbah dengan Benar: Pastikan Anda memisahkan limbah yang bisa didaur ulang dari limbah yang tidak bisa didaur ulang. Kategorikan bahan-bahan seperti kertas, plastik, logam, dan kaca ke dalam wadah terpisah.\n\n'
                              '2. Bersihkan Bahan Daur Ulang: Sebelum memasukkan bahan ke dalam tempat daur ulang, pastikan untuk membersihkannya terlebih dahulu. Misalnya, bilas botol plastik dan kaleng makanan untuk menghilangkan sisa makanan atau minuman. \n\n'
                              '3. Periksa Simbol Daur Ulang: Tidak semua plastik bisa didaur ulang. Periksa simbol daur ulang pada kemasan plastik untuk mengetahui apakah plastik tersebut bisa didaur ulang atau tidak.\n\n'
                              '4. Kurangi Penggunaan Barang Sekali Pakai: Salah satu cara terbaik untuk mendaur ulang adalah dengan mengurangi penggunaan barang sekali pakai seperti botol plastik, kantong plastik, dan peralatan makan sekali pakai. Gunakan alternatif yang dapat digunakan kembali seperti botol air stainless steel, tas belanja kain, dan peralatan makan yang dapat dicuci.\n\n'
                              '5. Dukung Program Daur Ulang Lokal: Cari tahu tentang program daur ulang di komunitas Anda dan ikuti panduan mereka. Banyak kota memiliki program daur ulang yang berbeda-beda, jadi penting untuk mengikuti aturan yang berlaku di daerah Anda.\n\n',
                          imageUrl: 'assets/images/artikel sampah 2.png',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/artikel sampah 2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Bagaimana cara mendaur ulang secara efesien',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          title: 'Bagaimana cara mendaur ulang di rumah',
                          content:
                              '1. Sediakan Tempat Sampah Khusus Daur Ulang: Miliki beberapa tempat sampah terpisah untuk berbagai jenis bahan daur ulang seperti kertas, plastik, logam, dan kaca. Labeli masing-masing tempat sampah agar anggota keluarga tahu di mana harus membuang bahan daur ulang.\n\n'
                              '2. Kompos untuk Limbah Organik: Mulailah membuat kompos untuk limbah dapur seperti sisa sayuran, kulit buah, dan daun teh. Kompos dapat digunakan sebagai pupuk alami untuk taman atau tanaman hias Anda.\n\n'
                              '3. Kurangi dan Gunakan Kembali: Kurangi penggunaan produk yang menghasilkan limbah dan pilihlah produk yang dapat digunakan kembali. Misalnya, gunakan kantong belanja kain daripada kantong plastik dan botol air yang dapat diisi ulang daripada botol sekali pakai.\n\n'
                              '4. Edukasi Keluarga: Ajarkan anggota keluarga tentang pentingnya daur ulang dan cara melakukannya dengan benar. Buat aktivitas daur ulang menjadi menyenangkan dengan melibatkan anak-anak dalam prosesnya.\n\n'
                              '5. Manfaatkan Layanan Daur Ulang: Jika ada layanan daur ulang yang disediakan oleh pemerintah lokal atau perusahaan swasta, pastikan Anda memanfaatkannya. Beberapa layanan bahkan menyediakan pengambilan bahan daur ulang dari rumah Anda.\n\n'
                              '6. Daur Ulang Barang Elektronik: Jangan membuang barang elektronik seperti ponsel, baterai, dan komputer ke tempat sampah biasa. Cari tahu tempat pengumpulan barang elektronik bekas di daerah Anda dan bawa barang-barang tersebut ke sana untuk didaur ulang.\n\n',
                          imageUrl: 'assets/images/artikel sampah 3.png',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/artikel sampah 3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Bagaimana cara mendaur ulang di rumah',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
