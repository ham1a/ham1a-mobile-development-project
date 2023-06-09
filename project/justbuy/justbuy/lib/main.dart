import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:justbuy/login.dart';
import 'package:justbuy/provider/homeprovider.dart';
import 'package:justbuy/provider/register_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  final clothesCollectionRef = FirebaseFirestore.instance.collection('clothes');
  final clothesSnapshot = await clothesCollectionRef.get();

  if (clothesSnapshot.docs.isEmpty) {
    for (int i = 0; i < names.length; i++) {
      FirebaseFirestore.instance.collection('clothes').add({
        'name': names[i],
        'price': i * 10.0,
        'imageUrl': images[i],
      });
    }
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ChangeNotifierProvider(create: (_) => NavigationState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: BotToastInit(),
        title: 'JustBuy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Login());
  }
}

List<String> images = [
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6d284fa8-f0c4-41f0-8a84-6a12fe6239db/ready-mens-dri-fit-1-4-zip-fitness-top-fWVcdq.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1a247a3b-5f17-4e49-ab50-ac9c201834cf/acg-mens-long-sleeve-t-shirt-bp2mWM.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ec060876-43be-421a-8e21-ac044cd0f447/sportswear-club-mens-long-sleeve-t-shirt-LJ1QzG.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1a486057-2cb2-4b80-8fad-b1045307aa79/pro-dri-fit-mens-1-4-zip-hyper-dry-training-top-qRd94m.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6fc64300-2850-461f-bda2-dba561eadb88/sportswear-mens-long-sleeve-t-shirt-3ZvNNS.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ceaa9d7c-b7f8-47a9-981f-86ac52f0ffb2/ready-mens-dri-fit-1-4-zip-fitness-top-fWVcdq.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a627002f-2b20-49ff-bcb0-a71c31a8ee49/air-mens-long-sleeve-t-shirt-hkcz6K.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/593f9dd6-5ed1-4a93-bf2a-61d029941024/sportswear-mens-long-sleeve-t-shirt-dCR1CW.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/36e75e2e-bd38-4db4-8687-99b329a07f7d/jordan-wordmark-mens-long-sleeve-t-shirt-DvBGRL.png',
  'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f37b29de-04ea-40db-94aa-4a0fde5021f9/therma-fit-run-division-element-mens-1-2-zip-running-top-bxPSK1.png'
];
List<String> names = [
  '  Men\'s Dri-FIT ',
  "Men's Long-Sleeve T-Shirt",
  "Nike Sportswear Club",
  "Nike Pro Dri-FIT",
  "Nike Sportswear",
  "Nike Running Top",
  "Men's Long-Sleeve",
  "Men's Long-Sleeve",
  "Men's Long-Sleeve",
  "Run Division Element"
];
