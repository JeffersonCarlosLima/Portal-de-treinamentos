// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:crypto/crypto.dart'; // Correção 3: Corrigir importação

Future<String> coverterMD5(String senhaLogin) async {
  //Adicionar parâmetro para receber a senha do TextField
  //String senhaLogin = senhaLoginUp.toUpperCase(); //converte para maísculo

  List<int> bytes = utf8.encode(senhaLogin); // converte a senha em bytes

  Digest md5Hash =
      md5.convert(bytes); // aplica o algoritmo MD5 nos bytes da senha

  String senhaCriptografada =
      md5Hash.toString(); // converte o resultado em uma string hexadecimal

  return senhaCriptografada; // retorna a senha criptografada em MD5

  // String senhaLogin =
  //   password; // Substitua pela variável que recebe os dados do TextField
  //String senhaCriptografada = await coverterMD5(senhaLogin);
}
