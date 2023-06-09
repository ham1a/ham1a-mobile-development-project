import 'package:flutter/material.dart';
import 'package:justbuy/custom/color_file.dart';
import 'package:provider/provider.dart';

import 'provider/homeprovider.dart';
// Import the Cart class

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<NavigationState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: DynamicColor.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirmation'),
                  content:
                      Text('Are you sure you want to complete the purchase?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        cart.uploadCartData();
                        // Clear the cart and navigate to the home screen
                        cart.clearCart();
                        //
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      child: Text('Confirm'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: DynamicColor.primary,
                child: Center(
                    child: Text(
                  'Complete Purchase',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Add logic to complete the purchase
          //     // For example, you can show a confirmation dialog and clear the cart
          //     showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //         title: Text('Confirmation'),
          //         content:
          //             Text('Are you sure you want to complete the purchase?'),
          //         actions: [
          //           TextButton(
          //             onPressed: () {
          //               cart.uploadCartData();
          //               // Clear the cart and navigate to the home screen
          //               cart.clearCart();
          //
          //               Navigator.pop(context);
          //               Navigator.pop(context);
          //             },
          //             child: Text('Confirm'),
          //           ),
          //           TextButton(
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //             child: Text('Cancel'),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          //   child: Text('Complete Purchase'),
          // ),
        ],
      ),
    );
  }
}
