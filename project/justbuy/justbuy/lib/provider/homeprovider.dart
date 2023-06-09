import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justbuy/home.dart';
import 'package:justbuy/login.dart';

class NavigationState extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get cartCount => _items.length;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void uploadCartData() {
    try {
      FirebaseFirestore.instance.collection('carts').add({
        'totalBill': totalAmount,
        'cartItems': items.map((item) => item.toMap()).toList(),
      }).then((value) {
        BotToast.showText(text: ("Ordered Successfully"));
        Get.offAll(BottomNavigationBarWidget());
      });
    } catch (e) {
      BotToast.showText(text: (e as FirebaseAuthException).message!);
    }
  }

  void addItem(CartItem item) {
    final existingItemIndex =
        _items.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity++;
    } else {
      _items.add(item);
    }

    notifyListeners();
  }

  void updateCurrentIndex(int index, context) {
    _currentIndex = index;
    if (index == 2) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmation'),
          content: const Text('Are you sure you want to Logout?'),
          actions: [
            TextButton(
              onPressed: () {
                signOut(context);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _currentIndex = 0;
                notifyListeners();
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }

    notifyListeners();
  }

  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signOut(context) async {
    try {
      return await _auth.signOut().then((value) {
        _currentIndex = 0;
        notifyListeners();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Login()),
            (Route<dynamic> route) => route.isFirst);
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl; // New field
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'id': id,
      'qty': quantity
    };
  }
}
