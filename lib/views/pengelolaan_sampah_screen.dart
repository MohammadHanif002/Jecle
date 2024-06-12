import 'package:flutter/material.dart';
import 'package:jecle/views/pemanfaatan_sampah_anorganik_screen.dart';
import 'tatacara_pemilahan_sampah_screen.dart'; // Pastikan Anda mengimpor file baru yang telah dibuat
import 'package:jecle/views/tatacara_pemilahan_sampah_screen.dart';
import 'package:jecle/views/pemanfaatan_sampah_organik_screen.dart';
import 'package:jecle/views/pentingnya_daur_ulang_sampah_screen.dart';

class PengelolaanSampahScreen extends StatelessWidget {
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
        title: Text('Panduan Pengelolaan Sampah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SampahOption(
            title: 'Tata Cara Pemilahan Sampah',
            description:
                'Berikut adalah sedikit panduan mengenai cara memilah sampah dari Go-Trash.',
            icon: Icons.recycling,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TataCaraPemilahanSampahScreen(),
                ),
              );
            },
          ),
          SampahOption(
            title: 'Pemanfaatan Sampah Anorganik',
            description:
                'Berikut adalah rekomendasi bagaimana cara kita memanfaatkan sampah anorganik.',
            icon: Icons.delete,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PemanfaatanSampahAnorganikScreen(),
                ),
              );
            },
          ),
          SampahOption(
              title: 'Pemanfaatan Sampah Organik',
              description:
                  'Berikut adalah rekomendasi bagaimana cara kita memanfaatkan sampah organik.',
              icon: Icons.eco,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PemanfaatanSampahOrganikScreen(),
                  ),
                );
              }),
          SampahOption(
            title: 'Pentingnya Daur Ulang Sampah',
            description:
                'Berikut adalah rekomendasi bagaimana cara kita memanfaatkan sampah anorganik.',
            icon: Icons.autorenew,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PentingnyaDaurUlangSampahScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SampahOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const SampahOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0, color: Colors.blue),
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
