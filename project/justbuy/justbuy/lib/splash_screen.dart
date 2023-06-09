import 'package:flutter/material.dart';
import 'package:justbuy/custom/color_file.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({this.fromLoad});
  bool? fromLoad = false;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: DynamicColor.whiteColor,
          child: !widget.fromLoad! ? blueSplash() : whiteSplash()),
    );
  }

  blueSplash() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 4,
          child: Center(
            child: Image(
                image: const AssetImage('assets/splash.gif'),
                height: MediaQuery.of(context).size.height / 3),
          ),
          color: Colors.white,
        ),
      ),
    );
  }

  whiteSplash() {
    return Center(
      child: Container(
        child: Center(
          child: Image(
            fit: BoxFit.fill,
            image: const AssetImage("assets/Frame.png"),
          ),
        ),
      ),
    );
  }
}
