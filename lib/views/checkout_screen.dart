import 'package:flutter/material.dart';
import 'package:jecle/views/daur_ulang_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jecle/views/home_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Product> cart;
  final double saldo;

  CheckoutScreen({required this.cart, required this.saldo});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    total =
        widget.cart.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void increaseQuantity(Product product) {
    setState(() {
      product.quantity += 1;
      total += product.price;
    });
  }

  void decreaseQuantity(Product product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity -= 1;
        total -= product.price;
      } else {
        widget.cart.remove(product);
        total -= product.price;
      }
    });
  }

  void completeCheckout() {
    if (widget.saldo < total) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo tidak mencukupi!')),
      );
      return;
    }

    double newSaldo = widget.saldo - total;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setDouble('saldo', newSaldo);
    });

    setState(() {
      widget.cart.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Checkout berhasil!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  final product = widget.cart[index];
                  return ListTile(
                    leading:
                        Image.asset(product.imageUrl, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rp. ${product.price.toStringAsFixed(0)}'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                decreaseQuantity(product);
                              },
                            ),
                            Text('${product.quantity}'),
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                increaseQuantity(product);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.cart.remove(product);
                          total -= product.price * product.quantity;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Text('Total: Rp. ${total.toStringAsFixed(0)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: completeCheckout,
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
