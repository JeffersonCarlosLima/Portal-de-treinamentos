// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> verificaComentario(String? comentario) async {
  // Crie uma função que verifica se uma string tem mais de 10 caracteres e retorna verdadeiro ou falso.
  if (comentario == null) {
    return false;
  }
  return comentario.length > 10;
}
