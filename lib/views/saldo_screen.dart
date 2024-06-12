import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaldoScreen extends StatefulWidget {
  @override
  _SaldoScreenState createState() => _SaldoScreenState();
}

class _SaldoScreenState extends State<SaldoScreen> {
  final TextEditingController _saldoController = TextEditingController();
  double _dompet = 0.0;

  @override
  void initState() {
    super.initState();
    _loadDompet();
  }

  void _loadDompet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dompet = prefs.getDouble('dompet') ?? 0.0;
    });
  }

  void _saveSaldo() async {
    double saldo = double.tryParse(_saldoController.text) ?? 0.0;
    if (saldo <= _dompet) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('saldo', saldo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo berhasil diperbarui')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo melebihi jumlah uang di dompet')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Saldo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Uang di Dompet: Rp ${_dompet.toStringAsFixed(0)}'),
            TextField(
              controller: _saldoController,
              decoration: InputDecoration(labelText: 'Masukkan Saldo'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSaldo,
              child: Text('Simpan Saldo'),
            ),
          ],
        ),
      ),
    );
  }
}
