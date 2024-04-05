import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'campocomentar_widget.dart' show CampocomentarWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CampocomentarModel extends FlutterFlowModel<CampocomentarWidget> {
  ///  Local state fields for this component.

  int? iDModuloSelecionado;

  String? subComentario;

  int? cancel;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SubComentario widget.
  FocusNode? subComentarioFocusNode1;
  TextEditingController? subComentarioController1;
  String? Function(BuildContext, String?)? subComentarioController1Validator;
  // Stores action output result for [Backend Call - API (POSTComentario)] action in COMENTAR widget.
  ApiCallResponse? subcomentarioPost;
  // State field(s) for SubComentario widget.
  FocusNode? subComentarioFocusNode2;
  TextEditingController? subComentarioController2;
  String? Function(BuildContext, String?)? subComentarioController2Validator;
  // Stores action output result for [Backend Call - API (POSTComentario)] action in COMENTAR widget.
  ApiCallResponse? subcomentarioPostm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    subComentarioFocusNode1?.dispose();
    subComentarioController1?.dispose();

    subComentarioFocusNode2?.dispose();
    subComentarioController2?.dispose();
  }
}
