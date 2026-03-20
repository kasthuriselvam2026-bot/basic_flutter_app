import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {

    int total = 0;
    for (var item in cartItems) {
      total += item["price"] as int;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),

      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          var item = cartItems[index];

          return ListTile(
            leading: Image.asset(
              item["image"],
              width: 50,
            ),
            title: Text(item["name"]),
            subtitle: Text("₹${item["price"]}"),
          );
        },
      ),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          "Total: ₹$total",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18),
        ),
      ),
    );
  }
}