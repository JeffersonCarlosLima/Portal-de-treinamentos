import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Treinamento Group Code

class TreinamentoGroup {
  static String baseUrl = 'https://apiprofessor.ergonsistemas.com.br:7073';
  static Map<String, String> headers = {
    'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
  };
  static ValidarSenhaCall validarSenhaCall = ValidarSenhaCall();
  static CursoCall cursoCall = CursoCall();
  static ListaBancoCall listaBancoCall = ListaBancoCall();
  static ModuloCall moduloCall = ModuloCall();
  static ComentariosCall comentariosCall = ComentariosCall();
  static StatusCall statusCall = StatusCall();
  static POSTStatusModuloCall pOSTStatusModuloCall = POSTStatusModuloCall();
  static POSTComentarioCall pOSTComentarioCall = POSTComentarioCall();
  static CertificadoCall certificadoCall = CertificadoCall();
}

class ValidarSenhaCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ValidarSenha',
      apiUrl: '${TreinamentoGroup.baseUrl}/login',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'DATABASE': database,
        'CPF': cpf,
        'SENHA': senha,
        'TIPO': tipoValidaSenha,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  String? titleErro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].NOMECOMPLETO''',
      ));
  String? cpf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].CPF''',
      ));
}

class CursoCall {
  Future<ApiCallResponse> call({
    String? descricaocurso = '',
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Curso',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'CPF': cpf,
        'TIPO': tipoCurso,
        'DESCRICAOCURSO': descricaocurso,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? iDCurso(dynamic response) => (getJsonField(
        response,
        r'''$[:].IDCURSO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? ordem(dynamic response) => (getJsonField(
        response,
        r'''$[:].ORDEM''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? curso(dynamic response) => (getJsonField(
        response,
        r'''$[:].CURSO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? icone(dynamic response) => (getJsonField(
        response,
        r'''$[:].ICONE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? qTDModulo(dynamic response) => (getJsonField(
        response,
        r'''$[:].QTDEMODULO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? qTDConcluido(dynamic response) => (getJsonField(
        response,
        r'''$[:].QTDECONCLUIDO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? mediaAvaliacao(dynamic response) => (getJsonField(
        response,
        r'''$[:].MEDIAAVALIACAO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? observacoes(dynamic response) => (getJsonField(
        response,
        r'''$[:].OBSERVACOES''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ListaBancoCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaBanco',
      apiUrl: '${TreinamentoGroup.baseUrl}/login',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'CPF': cpf,
        'TIPO': "BANCO",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? database(dynamic response) => (getJsonField(
        response,
        r'''$[:].BANCODADOS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cliente(dynamic response) => (getJsonField(
        response,
        r'''$[:].CLIENTE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$[:].PATHLOGO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tipoEscola(dynamic response) => (getJsonField(
        response,
        r'''$[:].TIPO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  String? titleerro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
}

class ModuloCall {
  Future<ApiCallResponse> call({
    String? idcurso = '',
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Modulo',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'TIPO': tipoModulo,
        'IDCURSO': idcurso,
        'CPF': cpf,
        'NOME': nomeusuario,
        'BANCODADOS': database,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? modulos(dynamic response) => getJsonField(
        response,
        r'''$.MODULOS''',
        true,
      ) as List?;
  List? subMenu(dynamic response) => getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU''',
        true,
      ) as List?;
  String? refModulo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.MODULOS[:].MODULO''',
      ));
  List<String>? tempo(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].TEMPO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? btnConcluido(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].CONCLUIDO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? linkVideo(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].LINKVIDEO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? linkAuxiliar(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].LINKAUXILIAR''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submenuSubModulo(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].SUBMODULO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? iDModulo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.MODULOS[:].IDMODULO''',
      ));
  int? iDCurso(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.MODULOS[:].IDCURSO''',
      ));
  List<int>? iDSubModulo(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].SUBMENU[:].IDMODULO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? qtdModulo(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].QTDEMODULO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? qtdConcluido(dynamic response) => (getJsonField(
        response,
        r'''$.MODULOS[:].QTDECONCLUIDO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ComentariosCall {
  Future<ApiCallResponse> call({
    int? idmodulo,
    int? idcomentario,
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Comentarios',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'TIPO': tipoComentario,
        'IDMODULO': idmodulo,
        'IDCOMENTARIO': idcomentario,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? comentario(dynamic response) => getJsonField(
        response,
        r'''$.COMENTARIO''',
        true,
      ) as List?;
}

class StatusCall {
  Future<ApiCallResponse> call({
    int? idmodulo,
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'STATUS',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {
        'TIPO': "STATUS",
        'IDMODULO': idmodulo,
        'CPF': cpf,
        'NOME': nomeusuario,
        'BANCODADOS': database,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? idstatuts(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].IDSTATUS''',
      ));
  int? idmodulo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].IDMODULO''',
      ));
  String? cpf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].CPF''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].NOME''',
      ));
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].CONCLUIDO''',
      ));
  String? dataehora(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].DATACONCLUSAO''',
      ));
  int? avaliacao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].AVALIACAO''',
      ));
  String? bancodados(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].BANCODADOS''',
      ));
}

class POSTStatusModuloCall {
  Future<ApiCallResponse> call({
    String? nomeuserb64 = '',
    int? avaliacao,
    int? idmodulo,
    bool? concluido,
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    final ffApiRequestBody = '''
[{"IDMODULO": ${idmodulo},"CPF": "${cpf}","NOME": "${nomeuserb64}","CONCLUIDO": ${concluido},"AVALIACAO": ${avaliacao},"BANCODADOS": "${database}"}]''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTStatusModulo',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento?TIPO=STATUS',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTComentarioCall {
  Future<ApiCallResponse> call({
    String? nomebase64 = '',
    String? mensagemb64 = '',
    int? idmodulo,
    int? idcomentario,
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    final ffApiRequestBody = '''
[{"IDCOMENTARIO":${idcomentario},"IDMODULO":${idmodulo},"CPF":"${cpf}","NOME":"${nomebase64}","MENSAGEM":"${mensagemb64}","BANCODADOS":"${database}"}]''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTComentario',
      apiUrl: '${TreinamentoGroup.baseUrl}/treinamento?TIPO=COMENTARIO',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CertificadoCall {
  Future<ApiCallResponse> call({
    String? cpfuser = '',
    String? idcurso = '',
    String? cpf = '',
    String? senha = '',
    String? database = '',
    String? nomeusuario = '',
    String? tipoComentario = 'COMENTARIO',
    String? tipoStatus = 'STATUS',
    String? tipoModulo = 'MODULO',
    String? tipoCurso = 'CURSO',
    String? tipoValidaSenha = 'VALIDASENHACOMRETORNO',
    String? tipoPrograsso = 'PROGRESSO',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Certificado',
      apiUrl:
          '${TreinamentoGroup.baseUrl}/relatorio?tipo=GERATOKEN&IDRELATORIO=1231&PARAMETRO=CPF|${cpfuser}|IDCURSO|${idcurso}&AUTO=S&DATABASE=SERVIDORES',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic Z2VwbW9iaWxlOkAjZ2VwbW9iaWxlI0A=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].TOKEN''',
      ));
}

/// End Treinamento Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
