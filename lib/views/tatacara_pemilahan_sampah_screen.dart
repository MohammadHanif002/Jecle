import 'package:flutter/material.dart';

class TataCaraPemilahanSampahScreen extends StatelessWidget {
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
        title: Text('Tata Cara Pemilahan Sampah'),
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
              'Tata Cara Pemilahan Sampah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
                'assets/images/pemilihanasampah.jpg'), // Ganti dengan path gambar Anda
            SizedBox(height: 16),
            Text(
              '1. Pisahkan sampah organik dan anorganik.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Sampah organik meliputi sisa makanan, dedaunan, dan bahan-bahan yang dapat terurai secara alami. Sampah anorganik meliputi plastik, logam, kaca, dan bahan-bahan yang tidak dapat terurai secara alami.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Gunakan tempat sampah yang berbeda.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Gunakan tempat sampah yang berbeda untuk sampah organik dan anorganik. Ini akan memudahkan proses daur ulang dan pengolahan sampah lebih lanjut.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Bersihkan sampah anorganik sebelum dibuang.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Pastikan untuk membersihkan sampah anorganik seperti botol plastik dan kaleng sebelum dibuang. Ini membantu dalam proses daur ulang dan mencegah penyebaran bau tidak sedap.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '4. Kurangi penggunaan plastik sekali pakai.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Kurangi penggunaan plastik sekali pakai dengan membawa tas belanja sendiri, menggunakan botol minum yang dapat diisi ulang, dan memilih produk dengan kemasan ramah lingkungan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Daur ulang sampah anorganik.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Kumpulkan sampah anorganik yang dapat didaur ulang seperti kertas, kardus, dan kaleng, lalu bawa ke tempat daur ulang atau bank sampah terdekat.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
