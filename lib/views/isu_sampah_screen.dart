import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IsuSampahScreen extends StatelessWidget {
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
        title: Text('Informasi Isu Sampah'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100, // Sesuaikan dengan tinggi background yang diinginkan
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/background informasi sampah.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                IsuSampahItem(
                  title: 'Berbagai Isu Pengelolaan Sampah di Indonesia',
                  source: 'Universitas Jember',
                  date: '10 Oktober, 2020',
                  description:
                      'Berbagai konsep dan informasi penting dan mutakhir terkait pengolahan dan pengelolaan sampah di Indonesia diperkenalkan dan dipaparkan oleh ....',
                  url:
                      'https://enviro.teknik.unej.ac.id/tag/pengelolaan/#:~:text=Berbagai%20konsep%20dan%20informasi%20penting,Lingkungan%2C%20Pusat%20Teknologi%20Lingkungan%2C%E2%80%A6',
                ),

                IsuSampahItem(
                  title:
                      'Tiga Permasalahan Mendasar Sampah yang Tidak Kunjung Selesai',
                  source: 'Kompas.id',
                  date: '7 April, 2023',
                  description:
                      'Sampah terus menjadi masalah meski banyak inovasi dalam pengelolaannya. Sampah kantong plastik dan kemasan produk kebutuhan sehari-hari ...',
                  url:
                      'https://www.kompas.id/baca/humaniora/2023/04/06/tiga-permasalahan-mendasar-sampah-yang-tidak-kunjung-selesai',
                ),
                // Tambahkan item lainnya jika diperlukan
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IsuSampahItem extends StatelessWidget {
  final String title;
  final String source;
  final String date;
  final String description;
  final String url;

  const IsuSampahItem({
    required this.title,
    required this.source,
    required this.date,
    required this.description,
    required this.url,
  });

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            source,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(description),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => _launchURL(url),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(48, 133, 195, 1),
              ),
              child: Text(
                'Baca selengkapnya >>>',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
