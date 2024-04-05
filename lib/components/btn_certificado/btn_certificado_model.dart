import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'btn_certificado_widget.dart' show BtnCertificadoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BtnCertificadoModel extends FlutterFlowModel<BtnCertificadoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for certificado widget.
  bool certificadoHovered = false;
  // Stores action output result for [Backend Call - API (Certificado)] action in certificado widget.
  ApiCallResponse? geraCertificado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
