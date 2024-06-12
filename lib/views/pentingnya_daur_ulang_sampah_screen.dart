import 'package:flutter/material.dart';

class PentingnyaDaurUlangSampahScreen extends StatelessWidget {
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
        title: Text('Pentingnya Daur Ulang Sampah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pentingnya Daur Ulang Sampah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
                'assets/images/daurUlangsampah.jpeg'), // Ganti dengan path gambar Anda
            SizedBox(height: 16),
            Text(
              '1. Mengurangi Sampah di Tempat Pembuangan Akhir',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Daur ulang membantu mengurangi jumlah sampah yang berakhir di tempat pembuangan akhir, sehingga mengurangi dampak negatif terhadap lingkungan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Menghemat Sumber Daya Alam',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Dengan mendaur ulang, kita bisa menghemat sumber daya alam yang terbatas dan menjaga kelestarian lingkungan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Mengurangi Polusi',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Proses produksi barang baru dari bahan daur ulang biasanya menghasilkan polusi yang lebih sedikit dibandingkan dengan menggunakan bahan baku baru.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '4. Menciptakan Lapangan Kerja',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Industri daur ulang dapat menciptakan lapangan kerja baru di berbagai sektor, mulai dari pengumpulan sampah hingga pengolahan dan produksi barang daur ulang.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Meningkatkan Kesadaran Lingkungan',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Dengan mendaur ulang, kita ikut serta dalam meningkatkan kesadaran lingkungan dan menjadi contoh bagi orang lain untuk melakukan hal yang sama.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
