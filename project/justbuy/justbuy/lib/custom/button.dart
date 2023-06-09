import 'package:flutter/material.dart';
import 'package:justbuy/custom/text_styling.dart';

import 'color_file.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {Key? key,
      this.text,
      this.onTap,
      this.height,
      this.isGradient = false,
      this.isCenter = true,
      this.width,
      this.btnColor,
      this.gradient1,
      this.gradient2,
      this.borderColor = Colors.white,
      this.isBorder = false,
      this.boxShadow = false,
      this.textColor,
      this.prefixIcon,
      this.borderRadius,
      this.child,
      this.textStyle,
      this.suffix})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? gradient1;
  final Color? gradient2;
  final Color? borderColor;
  final bool? isBorder;
  final IconData? prefixIcon;
  final bool? isCenter;
  final BorderRadius? borderRadius;
  final bool? boxShadow;
  final bool? isGradient;
  final Color? textColor;
  final TextStyle? textStyle;
  final Widget? child;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    final double widths = MediaQuery.of(context).size.width;
    final double heights = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? widths / 1.3, height: height ?? heights / 17,
        // padding: EdgeInsets.all(4),

        decoration: BoxDecoration(
            gradient: isGradient == false
                ? null
                : LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      DynamicColor.gradientOne,
                      DynamicColor.primaryColor,
                    ],
                  ),
            boxShadow: boxShadow == false
                ? []
                : [
                    BoxShadow(
                      color: btnColor != null
                          ? btnColor!.withOpacity(0.5)
                          : DynamicColor.primaryColor.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 15,
                    ),
                  ],
            color: btnColor ?? DynamicColor.whiteColor,
            border: isBorder!
                ? Border.all(color: borderColor ?? DynamicColor.primary)
                : Border.all(color: Colors.transparent),
            borderRadius: borderRadius ?? BorderRadius.circular(20)),
        child: child != null
            ? Container(child: child)
            : prefixIcon == null
                ? isCenter == true
                    ? Center(
                        child: suffix == null
                            ? Text(
                                text ?? '',
                                style: textStyle ??
                                    elione(
                                        color: textColor ?? Colors.white,
                                        fontSize: heights / 45),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    text ?? '',
                                    style: textStyle ??
                                        elione(
                                            color: textColor ?? Colors.white,
                                            fontSize: heights / 45),
                                  ),
                                  suffix!,
                                ],
                              ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          text ?? '',
                          style: textStyle ??
                              elione(
                                  color: textColor ?? Colors.white,
                                  fontSize: heights / 35),
                        ),
                      )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        color: DynamicColor.whiteColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        text ?? '',
                        style: textStyle ??
                            elione(
                                color: textColor ?? Colors.white,
                                fontSize: heights / 35),
                      ),
                    ],
                  ),
      ),
    );
  }

  elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(1.0),
          side: BorderSide(
            color: borderColor ?? DynamicColor.primary,
          )),
      primary: btnColor ?? DynamicColor.whiteColor,
      onPrimary: DynamicColor.primary,
      onSurface: DynamicColor.primary,
      shadowColor: DynamicColor.primary,
      elevation: 0.0,
      textStyle: textStyle ?? elione(),
      padding: isGradient == false
          ? EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0)
          : EdgeInsets.zero,
      minimumSize: Size(20, 20),
      enabledMouseCursor: MouseCursor.defer,
      disabledMouseCursor: MouseCursor.uncontrolled,
      visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0),
      tapTargetSize: MaterialTapTargetSize.padded,
      animationDuration: Duration(milliseconds: 100),
      enableFeedback: true,
      alignment: Alignment.bottomCenter,
    );
  }
}
