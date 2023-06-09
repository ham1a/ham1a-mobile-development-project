import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:justbuy/custom/color_file.dart';
import 'package:justbuy/provider/homeprovider.dart';
import 'package:provider/provider.dart';

import 'cartWidget.dart';

// Create the bottom navigation bar widget
class BottomNavigationBarWidget extends StatelessWidget {
  final List<Widget> screens = [HomeScreen(), CartScreen(), Container()];

  @override
  Widget build(BuildContext context) {
    final navigationState = Provider.of<NavigationState>(context);

    return Scaffold(
      body: screens[navigationState.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            DynamicColor.primary, // Set the selected item's icon and text color

        currentIndex: navigationState.currentIndex,
        onTap: (index) {
          navigationState.updateCurrentIndex(index, context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}

// Create the home screen widget
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<NavigationState>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: DynamicColor.primary,
          title: Text('Home'),
          actions: [
            Consumer<NavigationState>(
              builder: (context, cart, child) => Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  if (cart.cartCount > 0)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          cart.cartCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('clothes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final clothes = snapshot.data!.docs;

                return SingleChildScrollView(
                    child: Wrap(
                        direction: Axis.horizontal,
                        children: clothes.map((i) {
                          final item = CartItem(
                            id: i.id,
                            name: i['name'],
                            price: i['price'].toDouble(),
                            imageUrl: i['imageUrl'],
                          );
                          return Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Card(
                              color: DynamicColor.primary,
                              elevation: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: item.imageUrl,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  // Expanded(
                                  //   child: Image.network(
                                  //     item.imageUrl,
                                  //     fit: BoxFit.cover,
                                  //     height: 80,
                                  //     width: 80,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          '\$${item.price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 10),
                                        child: InkWell(
                                          onTap: () {
                                            cart.addItem(item);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()));
              }),
        ));
  }
}

// Create the cart screen widget

// Create the settings screen widget
