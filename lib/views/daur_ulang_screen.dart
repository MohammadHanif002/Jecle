import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jecle/views/home_screen.dart';
import 'package:jecle/views/checkout_screen.dart';

class DaurUlangScreen extends StatefulWidget {
  @override
  _DaurUlangScreenState createState() => _DaurUlangScreenState();
}

class _DaurUlangScreenState extends State<DaurUlangScreen> {
  final List<Product> products = [
    Product(
      name: 'Lampu Botol Kerip-kerlip',
      imageUrl: 'assets/images/hasil daur ulang1.png',
      price: 130000.0,
    ),
    Product(
      name: 'Penyimpanan Botol Klasik',
      imageUrl: 'assets/images/hasil daur ulang2.png',
      price: 15000.0,
    ),
    Product(
      name: 'Hiasan Dinding Kerangsik',
      imageUrl: 'assets/images/hasil daur ulang3.png',
      price: 40000.0,
    ),
    Product(
      name: 'Vas Copule Jeraph',
      imageUrl: 'assets/images/hasil daur ulang4.png',
      price: 110000.0,
    ),
    Product(
      name: 'Tabungan Kardus Comelun',
      imageUrl: 'assets/images/hasil daur ulang5.png',
      price: 50000.0,
    ),
    Product(
      name: 'Vas Bunga kiyowoi',
      imageUrl: 'assets/images/hasil daur ulang6.png',
      price: 30000.0,
    ),
  ];

  List<Product> cart = [];
  double _saldo = 0.0;

  @override
  void initState() {
    super.initState();
    _loadSaldo();
  }

  void _loadSaldo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _saldo = prefs.getDouble('saldo') ?? 0.0;
    });
  }

  void addToCart(Product product) {
    setState(() {
      // Check if product already in cart, increase quantity if true
      final existingProduct = cart.firstWhere(
        (p) => p.name == product.name,
        orElse: () => Product(name: '', imageUrl: '', price: 0),
      );
      if (existingProduct.name != '') {
        existingProduct.quantity += 1;
      } else {
        cart.add(product);
      }
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  void checkout() {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Keranjang kosong!')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(cart: cart, saldo: _saldo),
      ),
    );
  }

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
        title: Text('Daur Ulang'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(255, 255, 255, 1),
            onPressed: checkout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Rp. ${product.price.toStringAsFixed(0)}',
                          style:
                              TextStyle(color: Color.fromRGBO(48, 133, 195, 1)),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${product.name} ditambahkan ke keranjang')),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(48, 133, 195, 1),
                              ),
                              child: Text(
                                'Beli',
                                style: TextStyle(
                                    color: Colors.white), // Text color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}
