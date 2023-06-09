import 'package:flutter/material.dart';

customSnack({required label, required text, required onclick}) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(text),
    action: SnackBarAction(label: label, onPressed: onclick),
  );
}
