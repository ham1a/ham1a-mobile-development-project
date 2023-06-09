import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterProvider extends ChangeNotifier {
  bool showPass = true;
  bool showPassSignupOne = true;
  bool showPassSignupTwo = true;
  bool loader = false;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController userName = TextEditingController();
  TextEditingController signupUserName = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  String? mainId;
  RxBool loading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInWithEmailAndPassword() async {
    loading.value = true;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: userName.text, password: password.text);

      User? user = result.user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      BotToast.showText(text: (e as FirebaseAuthException).message!);
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword() async {
    loading.value = true;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: signupEmail.text, password: signupPassword.text);
      User? user = result.user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      BotToast.showText(text: (e as FirebaseAuthException).message!);

      return null;
    }
  }

  onShow() {
    showPass = !showPass;
    notifyListeners();
  }

  onShowSignUp() {
    showPassSignupOne = !showPassSignupOne;
    notifyListeners();
  }

  onShowSignUpTwo() {
    showPassSignupTwo = !showPassSignupTwo;
    notifyListeners();
  }
}
