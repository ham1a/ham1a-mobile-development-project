import 'package:flutter/material.dart';

import 'color_file.dart';
import 'text_styling.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  dynamic loginController;
  String? label;

  bool isValidate = true;
  bool? isEmail = false;
  bool? isPhoneNumber = false;
  bool? isPassword = false;
  bool? isContainerBorder = true;
  VoidCallback? onTap;
  bool? isPhone = false;
  bool? isBorder = false;
  bool? isConfirmPassword = false;
  bool? readOnly = false;
  bool? isFromSignup = false;
  bool? isFromSetting = false;
  String? validationError;
  int? maxLines = 1;
  int? maxLength;
  String? hint;
  double? radius;
  Color? color;
  Color? cursorColor;
  ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  dynamic formatter;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final double? fieldPadding;
  final TextStyle? hintStyle;
  final TextStyle? style;
  var validating;
  IconData? feildIcon;
  bool? isEnable;
  CustomTextField(
      {Key? key,
      this.isPhoneNumber,
      this.fieldPadding,
      this.validating,
      this.isEnable,
      this.hintStyle,
      this.controller,
      this.isEmail = false,
      this.isPassword = false,
      this.isFromSignup = false,
      this.validationError,
      this.loginController,
      this.padding,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.onTap,
      this.style,
      this.formatter,
      this.cursorColor,
      this.contentPadding,
      this.readOnly = false,
      this.isFromSetting = false,
      this.isContainerBorder = true,
      this.hint,
      this.color,
      this.radius,
      this.maxLength,
      this.maxLines = 1,
      this.isPhone = false,
      this.isBorder = false,
      this.feildIcon,
      this.label,
      this.isValidate = true,
      this.isConfirmPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    return
        // Padding(
        // padding:
        //     padding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        // child: Container(
        //   //padding: contentPadding ?? const EdgeInsets.all(0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(radius ?? 0),
        //   ),
        //   child:
        Material(
      color: Colors.white,
      elevation: 0.0,
      shadowColor: DynamicColor.primaryColor,
      child: Center(
        child: Theme(
          data: ThemeData(
            primaryColor: DynamicColor.primaryColor,
            primaryColorDark: DynamicColor.primaryColor,
          ),
          child: TextFormField(
            inputFormatters: formatter,
            onTap: onTap,
            readOnly: readOnly!,
            controller: controller,
            cursorColor: cursorColor ?? DynamicColor.secondary,
            enabled: isEnable ?? true,
            onFieldSubmitted: onFieldSubmitted, //
            onChanged: onChanged,
            maxLines: maxLines,
            maxLength: maxLength,
            style: style ??
                poppins(
                  fontSize: MediaQuery.of(context).size.height / 55,
                  color: DynamicColor.fontColor,
                  fontWeight: FontWeight.w300,
                ),
            obscureText: isPassword == true ? true : false,
            keyboardType: isPhone == true
                ? TextInputType.phone
                : isEmail == true
                    ? TextInputType.emailAddress
                    : TextInputType.text,
            validator: validating ??
                (value) {
                  if (isValidate) {
                    if (value!.isEmpty) {
                      return 'Please enter your $validationError';
                    } else if (isConfirmPassword == true) {
                      if (loginController.signUpPasswordController.text ==
                          loginController
                              .signUpConfirmPasswordController.text) {
                        return null;
                      } else {
                        return "Password doesn't match";
                      }
                    } else {
                      if (isEmail == true) {
                        return validateEmail(value);
                      } else if (isPhoneNumber == true) {
                        return validateMobile(value);
                      } else {
                        return null;
                      }
                    }
                  } else {
                    return null;
                  }
                },

            decoration: feildIcon != null
                ? InputDecoration(
                    // labelStyle: poppins(
                    //     fontWeight: FontWeight.bold,
                    //     color: DynamicColor.fontColor,
                    //     fontSize: MediaQuery.of(context).size.height / 45),
                    // labelText: label,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        feildIcon!,
                        color: DynamicColor.fontColor,
                      ),
                    ),
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        left: 5,
                        top: prefixIcon == null && suffixIcon == null
                            ? fieldPadding ?? 0
                            : 15),
                    border: isBorder != true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.grey[300]!))
                        : InputBorder.none,
                    enabledBorder: isBorder != true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                              color: DynamicColor.grey,
                            ),
                          )
                        : InputBorder.none,
                    hintText: hint ?? "",
                    suffixIcon: suffixIcon,
                    hintStyle: hintStyle ??
                        elione(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height / 55),
                    prefixIcon: prefixIcon,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        borderSide: BorderSide(
                          color: DynamicColor.grey,
                        )))
                : InputDecoration(
                    labelStyle: poppins(
                      fontWeight: FontWeight.w200,
                      color: DynamicColor.primaryColor,
                      fontSize: MediaQuery.of(context).size.height / 45,
                    ),
                    labelText: label,
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        left: 5,
                        top: prefixIcon == null && suffixIcon == null
                            ? fieldPadding ?? 0
                            : 15),
                    border:
                        // isBorder == true
                        // ?
                        OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            borderSide: BorderSide(color: Colors.grey[300]!)),
                    // : InputBorder.none,
                    enabledBorder:
                        //isBorder != true
                        //  ?
                        OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            borderSide: BorderSide(color: DynamicColor.grey)),
                    // : InputBorder.none,
                    hintText: hint ?? "",
                    suffixIcon: suffixIcon,
                    hintStyle: hintStyle ??
                        elione(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height / 55),
                    prefixIcon: prefixIcon,
                    focusColor: DynamicColor.grey,
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: DynamicColor.primary,
                        ))),
          ),
        ),
      ),
    );
  }

  validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  validateMobile(String value) {
    String pattern = r'[0-9]{9}';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
