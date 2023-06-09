import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'color_file.dart';

class LoaderClass extends StatelessWidget {
  final Widget? child;
  const LoaderClass({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: kToolbarHeight + 10,
                child: const Center(
                    child: Text(
                  "Center",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              )),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight * 2),
            child: child ?? Container(),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: LoadingAnimationWidget.fourRotatingDots(
                  size: 80.0, color: DynamicColor.primaryColor))
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: const Offset(0, 3), // changes position of shadow
          //         ),
          //       ],
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(30),
          //       child: LoadingAnimationWidget.newtonCradle(
          //         size: 80.0,color: DynamicColor.primaryColor)
          //
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
