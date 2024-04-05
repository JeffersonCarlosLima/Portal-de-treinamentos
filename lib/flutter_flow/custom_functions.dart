import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

int? calculaPorcentagem(
  int? qtdConcluido,
  int? qtdModulos,
) {
  // converta duas variaveis string  para inteiro e faça o calculo de porcentagem
  if (qtdConcluido == null || qtdModulos == null || qtdModulos == 0) {
    return 0;
  }
  return ((qtdConcluido * 100) ~/
      qtdModulos); // ~~/ is used for integer division
}

double? convertPorcentagemFrac(
  int? qtdConcluido,
  int? qtdModulos,
) {
  // receba um 2 numeros e converta para decimal para porcentagem de forma fracionada
  if (qtdConcluido == null || qtdModulos == null || qtdModulos == 0) {
    return 0;
  }
  double porcentagem = (qtdConcluido / qtdModulos) * 100;
  return porcentagem / 100;
}

String? convertStringToBase64(String? dadoConvert) {
  // verifique a função
// implement the function to convert a string to base64 encoding
  return dadoConvert != null ? base64.encode(utf8.encode(dadoConvert)) : null;
}

bool validasenha(int? valor) {
  // crie a função onde verifique se o campo possui mais de 4 intens e retorne um valor boleano
  if (valor != null && valor.toString().length > 4) {
    return true;
  } else {
    return false;
  }
}

String? convertBase64toUtf8(String? dadoConvert) {
  // refaça a função criando de outra maneira
  return dadoConvert != null ? latin1.decode(base64.decode(dadoConvert)) : null;
}

List<int>? percorrerListaDownint(
  List<int>? lista,
  int? index,
) {
  // crie uma função que recebe uma lista, seleciona sempre o proximo ordem crescente retorna
  if (lista == null || lista.isEmpty) {
    return null;
  }
  if (index == null) {
    return [lista.first];
  }
  int currentIndex = lista.indexOf(index);
  if (currentIndex == -1 || currentIndex == lista.length - 1) {
    return [lista.last];
  }
  return [lista[currentIndex + 1]];
}

List<String>? percorrerListaUP(
  List<String>? lista,
  String? index,
) {
  // crie uma função que recebe uma lista, seleciona sempre o proximo ordem crescente retorna
  if (lista == null || lista.isEmpty) {
    return null;
  }
  if (index == null) {
    return [lista.first];
  }
  int currentIndex = lista.indexOf(index);
  if (currentIndex == -1 || currentIndex == 0) {
    return [lista.first];
  }
  return [lista[currentIndex - 1]];
}

List<int>? percorrerListaUPint(
  List<int>? lista,
  int? index,
) {
  // crie uma função que recebe uma lista, seleciona sempre o proximo ordem crescente retorna
  if (lista == null || lista.isEmpty) {
    return null;
  }
  if (index == null) {
    return [lista.first];
  }
  int currentIndex = lista.indexOf(index);
  if (currentIndex == -1 || currentIndex == 0) {
    return [lista.first];
  }
  return [lista[currentIndex - 1]];
}

List<String>? percorrerListaDown(
  List<String>? lista,
  String? index,
) {
  // crie uma função que recebe uma lista, seleciona sempre o proximo ordem crescente retorna
  if (lista == null || lista.isEmpty) {
    return null;
  }
  if (index == null) {
    return [lista.first];
  }
  int currentIndex = lista.indexOf(index);
  if (currentIndex == -1 || currentIndex == lista.length - 1) {
    return [lista.last];
  }
  return [lista[currentIndex + 1]];
}

int? contaArrey(dynamic lista) {
  // crie uma função que conta itens de um arrey json e retorna a quandidade em números
  if (lista is List) {
    return lista.length;
  } else {
    return null;
  }
}
