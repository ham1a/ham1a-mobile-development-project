import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justbuy/custom/loader.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart' as signshort;

import 'custom/button.dart';
import 'custom/color_file.dart';
import 'custom/text_styling.dart';
import 'custom/textfield.dart';
import 'home.dart';
import 'login.dart';
import 'provider/register_provider.dart';

class Register extends StatelessWidget {
  var formKeyTwo = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    var customWidth = MediaQuery.of(context).size.width;
    return WillPopScope(onWillPop: () {
      Get.offAll(Login());
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
                    key: formKeyTwo,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: customHeight / 25,
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,
                            ),
                            onTap: () {
                              Get.offAll(Login());
                            },
                          ),
                          SizedBox(
                            height: customHeight / 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Register',
                              style: elione(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: customHeight / 35),
                            ),
                          ),
                          const SizedBox(
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
                                  width: customWidth / 4.5,
                                  height: 3,
                                  color: DynamicColor.primaryColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 25,
                          ),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username',
                              style: elione(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: customHeight / 45),
                            ),
                          ),
                          Container(
                            height: customHeight / 11,
                            // width: customWidth / 1.2,
                            child: CustomTextField(
                              validationError: 'username',
                              controller: provider.signupUserName,
                              prefixIcon: const Icon(Icons.perm_identity),
                              hint: 'Username',
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 90,
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
                            height: customHeight / 11,
                            child: CustomTextField(
                              validationError: 'email',
                              controller: provider.signupEmail,
                              prefixIcon: const Icon(Icons.mail),
                              isContainerBorder: true,
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
                            height: customHeight / 11,
                            child: CustomTextField(
                              validationError: 'password',
                              suffixIcon: provider.showPassSignupOne
                                  ? InkWell(
                                      onTap: () {
                                        provider.onShowSignUp();
                                      },
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        provider.onShowSignUp();
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: DynamicColor.primaryColor,
                                      )),
                              controller: provider.signupPassword,
                              prefixIcon: const Icon(Icons.lock),
                              hint: '******',
                              isPassword: provider.showPassSignupOne,
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 90,
                          ),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Confirm Password',
                              style: elione(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: customHeight / 45),
                            ),
                          ),
                          Container(
                            height: customHeight / 11,
                            // width: customWidth / 1.2,
                            child: CustomTextField(
                              validationError: 'password',
                              suffixIcon: provider.showPassSignupTwo
                                  ? InkWell(
                                      onTap: () {
                                        provider.onShowSignUpTwo();
                                      },
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        provider.onShowSignUpTwo();
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: DynamicColor.primaryColor,
                                      )),
                              controller: provider.confirmPassword,
                              prefixIcon: const Icon(Icons.lock),
                              hint: '******',
                              isPassword: provider.showPassSignupTwo,
                            ),
                          ),
                          SizedBox(
                            height: customHeight / 35,
                          ),
                          // Text(
                          //
                          //   'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our ',
                          //   style:   elione(fontWeight: FontWeight.w400,
                          //       color:  Colors.black,
                          //       fontSize: customHeight /50),
                          // ),

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
                                          if (formKeyTwo.currentState!
                                              .validate()) {
                                            if (provider.signupPassword.text
                                                    .length <
                                                8) {
                                              BotToast.showText(
                                                  text:
                                                      'The password must be at least 8 characters.');
                                            } else if (provider
                                                    .signupPassword.text !=
                                                provider.confirmPassword.text) {
                                              BotToast.showText(
                                                  text:
                                                      'The password confirmation does not match.');
                                            } else {
                                              await provider
                                                  .registerWithEmailAndPassword()
                                                  .then((value) {
                                                if (value != null) {
                                                  Get.offAll(
                                                      BottomNavigationBarWidget());
                                                  provider.signupEmail.clear();
                                                  provider.signupEmail.clear();
                                                }
                                              });
                                            }
                                          }
                                        },
                                        isBorder: false,
                                        borderColor: DynamicColor.secondary,
                                        text: 'Register',
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
                            height: customHeight / 45,
                          ),

                          // Platform.isAndroid
                          //     ? registerType(
                          //         customHeight, customWidth, provider, context)
                          //     : Container(),

                          // Center(
                          //   child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/googlelogo.png'),backgroundColor: Colors.white,),
                          //
                          //       SizedBox(
                          //         width: customWidth / 25,
                          //       ),
                          //       CircleAvatar(radius: 26,backgroundImage: AssetImage('assets/fblogo.webp'),backgroundColor: Colors.white,)
                          //     ],),
                          // )
                          // Center(
                          //   child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //     CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/googlelogo.png'),backgroundColor: Colors.white,),
                          //
                          //       SizedBox(
                          //        width: customWidth / 25,
                          //       ),
                          //     CircleAvatar(radius: 26,backgroundImage: AssetImage('assets/fblogo.webp'),backgroundColor: Colors.white,)
                          //   ],),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
    }));
  }

  Widget registerType(customHeight, customWidth, provider, context) {
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
          height: customHeight / 45,
        ),
        Center(
          child: signshort.SignInButton(
              buttonType: signshort.ButtonType.google,
              onPressed: () {
                provider.signInWithGoogle(context);
                print('click');
              }),
        ),
      ],
    );
  }
}
