import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'btn_certificado_model.dart';
export 'btn_certificado_model.dart';

class BtnCertificadoWidget extends StatefulWidget {
  const BtnCertificadoWidget({
    super.key,
    required this.totalConcluido,
    required this.totalModulo,
  });

  final int? totalConcluido;
  final int? totalModulo;

  @override
  State<BtnCertificadoWidget> createState() => _BtnCertificadoWidgetState();
}

class _BtnCertificadoWidgetState extends State<BtnCertificadoWidget> {
  late BtnCertificadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtnCertificadoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget.totalConcluido == widget.totalModulo) {
                _model.geraCertificado =
                    await TreinamentoGroup.certificadoCall.call(
                  cpfuser: FFAppState().cpfUsuario,
                  idcurso: FFAppState().IDcurso.toString(),
                );
                if ((_model.geraCertificado?.succeeded ?? true)) {
                  await launchURL(
                      'https://relatorios.ergonsistemas.com.br/?token=${TreinamentoGroup.certificadoCall.token(
                    (_model.geraCertificado?.jsonBody ?? ''),
                  )}&INI=servidores');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Hove problemas ao gerar seu certificado, tente novamente mais tarde.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).error,
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Conclua todas as aula para liberar o certificado!',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).warning,
                  ),
                );
              }

              setState(() {});
            },
            child: Material(
              color: Colors.transparent,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 58.0,
                  decoration: BoxDecoration(
                    color: () {
                      if ((_model.certificadoHovered == true) &&
                          (FFAppState().totConcluido ==
                              FFAppState().totModulo)) {
                        return FlutterFlowTheme.of(context).primary;
                      } else if (Theme.of(context).brightness ==
                          Brightness.dark) {
                        return Color(0x4983939B);
                      } else {
                        return FlutterFlowTheme.of(context).info;
                      }
                    }(),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: () {
                        if (FFAppState().darkMode) {
                          return Color(0xFFF7D6FF);
                        } else if (FFAppState().totConcluido ==
                            FFAppState().totModulo) {
                          return FlutterFlowTheme.of(context).accent1;
                        } else {
                          return FlutterFlowTheme.of(context).accent4;
                        }
                      }(),
                      width: 1.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.totalConcluido != widget.totalModulo)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.lock,
                              color: () {
                                if (FFAppState().darkMode) {
                                  return FlutterFlowTheme.of(context).info;
                                } else if (widget.totalConcluido !=
                                    widget.totalModulo) {
                                  return FlutterFlowTheme.of(context).accent4;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              size: 24.0,
                            ),
                          ),
                        if (widget.totalConcluido == widget.totalModulo)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.history_edu,
                              color: () {
                                if (FFAppState().darkMode) {
                                  return FlutterFlowTheme.of(context).info;
                                } else if ((_model.certificadoHovered ==
                                        true) &&
                                    (FFAppState().totConcluido ==
                                        FFAppState().totModulo)) {
                                  return FlutterFlowTheme.of(context).info;
                                } else {
                                  return FlutterFlowTheme.of(context).primary;
                                }
                              }(),
                              size: 24.0,
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Certificado de conclusão',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    color: () {
                                      if (FFAppState().darkMode) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      } else if ((_model.certificadoHovered ==
                                              true) &&
                                          (FFAppState().totConcluido ==
                                              FFAppState().totModulo)) {
                                        return FlutterFlowTheme.of(context)
                                            .info;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelLargeFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          setState(() => _model.certificadoHovered = true);
        }),
        onExit: ((event) async {
          setState(() => _model.certificadoHovered = false);
        }),
      ),
    );
  }
}
