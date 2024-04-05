// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> validaCPF(String? cpf) async {
  // crie uma função onde valida o cpf e retorne um valor boleano
  if (cpf == null || cpf.isEmpty) {
    return false;
  }

  // Remove caracteres não numéricos
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // Verifica se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return false;
  }

  // Verifica se todos os dígitos são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
    return false;
  }

  // Calcula o primeiro dígito verificador
  var soma = 0;
  for (var i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  var digito1 = 11 - (soma % 11);
  if (digito1 > 9) {
    digito1 = 0;
  }

  // Calcula o segundo dígito verificador
  soma = 0;
  for (var i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  var digito2 = 11 - (soma % 11);
  if (digito2 > 9) {
    digito2 = 0;
  }

  // Verifica se os dígitos verificadores estão corretos
  if (cpf[9] != digito1.toString() || cpf[10] != digito2.toString()) {
    return false;
  }

  return true;
}
