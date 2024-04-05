import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'concluir_aula_widget.dart' show ConcluirAulaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ConcluirAulaModel extends FlutterFlowModel<ConcluirAulaWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (POSTStatusModulo)] action in btnConcluir widget.
  ApiCallResponse? desConcluir;
  // Stores action output result for [Backend Call - API (POSTStatusModulo)] action in btnConcluir widget.
  ApiCallResponse? btnConcluir;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
