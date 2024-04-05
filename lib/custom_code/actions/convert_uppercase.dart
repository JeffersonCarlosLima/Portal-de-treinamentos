// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> convertUppercase(String? passwordController) async {
  // converta todas as letras digitadas no campo senha para maiúsculo
  if (passwordController == null) {
    return "";
  }
  return passwordController.toUpperCase();
}
