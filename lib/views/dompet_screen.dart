import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DompetScreen extends StatefulWidget {
  @override
  _DompetScreenState createState() => _DompetScreenState();
}

class _DompetScreenState extends State<DompetScreen> {
  final TextEditingController _dompetController = TextEditingController();

  void _saveDompet() async {
    double dompet = double.tryParse(_dompetController.text) ?? 0.0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('dompet', dompet);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dompet berhasil diperbarui')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Dompet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dompetController,
              decoration: InputDecoration(labelText: 'Masukkan Uang ke Dompet'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDompet,
              child: Text('Simpan ke Dompet'),
            ),
          ],
        ),
      ),
    );
  }
}
