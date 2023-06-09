import 'package:flutter/material.dart';
import 'package:justbuy/custom/color_file.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';
import 'provider/homeprovider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<NavigationState>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: DynamicColor.primary,
        title: Text('Cart'),
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Container(
                child: Text(
                  'Cart is Empty',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeItem(item);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          child: Container(
              height: 50,
              width: 80,
              color: DynamicColor.primary,
              child: Center(
                  child: Text(
                'Checkout',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))),
        ),
      ),
    );
  }
}
