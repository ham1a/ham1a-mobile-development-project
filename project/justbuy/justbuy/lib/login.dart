import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justbuy/signup.dart';
import 'package:provider/provider.dart';

import 'custom/button.dart';
import 'custom/color_file.dart';
import 'custom/loader.dart';
import 'custom/text_styling.dart';
import 'custom/textfield.dart';
import 'home.dart';
import 'provider/register_provider.dart';

class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    var customWidth = MediaQuery.of(context).size.width;
    return WillPopScope(onWillPop: () {
      return Future.value(false);
    }, child: Consumer<RegisterProvider>(builder: (contexts, provider, child) {
      return provider.loader
          ? LoaderClass()
          : SafeArea(
              child: Scaffold(
              backgroundColor: DynamicColor.whiteColor,
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: customHeight,
                  width: customWidth,
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: customHeight / 25,
                          ),

                          SizedBox(
                            height: customHeight / 20,
                          ),

                          SizedBox(
                            height: customHeight / 25,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Login',
                              style: elione(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: customHeight / 35),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 4,
                            width: customWidth,
                            child: Stack(
                              children: [
                                Container(
                                  width: customWidth,
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),
                                Container(
                                  width: customWidth / 5,
                                  height: 3,
                                  color: DynamicColor.primaryColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 25,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: const Align(
                          //     child: Icon(Icons.close),
                          //     alignment: Alignment.topLeft,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: customHeight / 5,
                          // ),
                          Text(
                            'Welcome back! sign in to your account',
                            style: elione(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: customHeight / 50),
                          ),
                          SizedBox(
                            height: customHeight / 25,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: elione(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: customHeight / 45),
                            ),
                          ),
                          Container(
                            height: customHeight / 10,
                            // width: customWidth / 1.2,
                            child: CustomTextField(
                              validationError: 'email or username',
                              controller: provider.userName,
                              prefixIcon: const Icon(Icons.perm_identity),
                              hint: 'abc@gmail.com',
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 90,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: elione(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: customHeight / 45),
                            ),
                          ),
                          Container(
                            height: customHeight / 10,
                            // width: customWidth / 1.2,
                            child: CustomTextField(
                              validationError: 'password',
                              controller: provider.password,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: provider.showPass
                                  ? InkWell(
                                      onTap: () {
                                        provider.onShow();
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        provider.onShow();
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: DynamicColor.primaryColor,
                                      )),
                              isContainerBorder: true,
                              hint: '****',
                              isPassword: provider.showPass,
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 35,
                          ),

                          Obx(
                            () => provider.loading.value
                                ? Center(
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator()),
                                  )
                                : Center(
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      elevation: 3,
                                      child: Buttons(
                                        btnColor: DynamicColor.primaryColor,
                                        isGradient: false,
                                        onTap: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            provider
                                                .signInWithEmailAndPassword()
                                                .then((value) {
                                              if (value != null) {
                                                Get.offAll(
                                                    BottomNavigationBarWidget());
                                              }
                                              provider.userName.clear();
                                              provider.password.clear();
                                            });

                                            //
                                            //   if (!await launchUrl(Uri.parse('https://justbuy.com'))) {
                                            //     throw Exception('Could not launch ');
                                            //   }
                                          }
                                        },
                                        isBorder: false,
                                        borderColor: DynamicColor.secondary,
                                        text: 'Login',
                                        textStyle: elione(
                                            color: DynamicColor.whiteColor,
                                            fontSize: customHeight / 55),
                                        width: customWidth / 1.8,
                                        height: 35,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: customHeight / 25,
                          ),

                          // Center(
                          //   child: Text(
                          //     'by signing up or logging in you accept\n our terms & condition',
                          //     style:
                          //     elione(fontWeight: FontWeight.bold,
                          //         color:  Colors.grey,
                          //         fontSize: customHeight /50),textAlign: TextAlign.center,
                          //   ),
                          // ),
                          // Platform.isAndroid
                          //     ?
                          loginType(
                              customHeight, customWidth, provider, context),
                          // : Container(),

                          Center(
                            child: InkWell(
                              onTap: () {
                                Get.offAll(Register(),
                                    transition: Transition.rightToLeftWithFade);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Don\'t have an Account? ',
                                  style: elione(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: customHeight / 55),
                                ),
                                TextSpan(
                                  text: 'Register',
                                  style: elione(
                                      fontWeight: FontWeight.bold,
                                      color: DynamicColor.primaryColor,
                                      fontSize: customHeight / 55),
                                ),
                              ])),
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
    }));
  }

  Widget loginType(customHeight, customWidth, provider, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'OR',
            style: poppins(color: Colors.black),
          ),
        ),
        SizedBox(
          height: customHeight / 80,
        ),
        Center(
          child: Container(
            height: 1,
            width: customWidth / 1.3,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        SizedBox(
          height: customHeight / 20,
        ),
      ],
    );
  }
}
