import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'concluir_aula_model.dart';
export 'concluir_aula_model.dart';

class ConcluirAulaWidget extends StatefulWidget {
  const ConcluirAulaWidget({
    super.key,
    required this.aulaConcluida,
    required this.idModulo,
  });

  final bool? aulaConcluida;
  final int? idModulo;

  @override
  State<ConcluirAulaWidget> createState() => _ConcluirAulaWidgetState();
}

class _ConcluirAulaWidgetState extends State<ConcluirAulaWidget>
    with TickerProviderStateMixin {
  late ConcluirAulaModel _model;

  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConcluirAulaModel());

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

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if ((widget.aulaConcluida == true) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                _model.desConcluir =
                    await TreinamentoGroup.pOSTStatusModuloCall.call(
                  idmodulo: widget.idModulo,
                  cpf: FFAppState().cpfUsuario,
                  nomeuserb64: FFAppState().nomeUsuarioB64,
                  concluido: false,
                  avaliacao: FFAppState().notaAula,
                  database: FFAppState().bancoUsuario,
                );
                if ((_model.desConcluir?.succeeded ?? true)) {
                  // inserir true var concluir
                  setState(() {
                    FFAppState().aulaConcluida = false;
                  });
                } else {
                  if (((_model.desConcluir?.statusCode ?? 200) == 404) ||
                      ((_model.desConcluir?.statusCode ?? 200) == 408) ||
                      ((_model.desConcluir?.statusCode ?? 200) == 401)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Problema ao se conectar ao servidor!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: Text('Atenção!'),
                            content: Text(
                                'Existe um problemas ao se conectar com o servidor, verifique a sua conexão coma a internet, e tente novamente.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }

                setState(() {});
              },
              text: 'Concluído',
              icon: Icon(
                Icons.check_circle,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              options: FFButtonOptions(
                width: 150.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).success,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
                hoverColor: Color(0xFF1A665D),
                hoverTextColor: FlutterFlowTheme.of(context).info,
              ),
            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation1']!),
          ),
        if ((widget.aulaConcluida == false) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                _model.btnConcluir =
                    await TreinamentoGroup.pOSTStatusModuloCall.call(
                  idmodulo: widget.idModulo,
                  cpf: FFAppState().cpfUsuario,
                  nomeuserb64: FFAppState().nomeUsuarioB64,
                  concluido: true,
                  avaliacao: FFAppState().notaAula,
                  database: FFAppState().bancoUsuario,
                );
                if ((_model.btnConcluir?.succeeded ?? true)) {
                  // inserir true var concluir
                  setState(() {
                    FFAppState().aulaConcluida = true;
                  });
                } else {
                  if (((_model.btnConcluir?.statusCode ?? 200) == 404) ||
                      ((_model.btnConcluir?.statusCode ?? 200) == 401)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Problema ao se conectar ao servidor!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: Text('Atenção!'),
                            content: Text(
                                'Existe um problemas ao se conectar com o servidor, verifique a sua conexão coma a internet, e tente novamente.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }

                setState(() {});
              },
              text: 'Concluir',
              icon: Icon(
                Icons.radio_button_off,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              options: FFButtonOptions(
                width: 150.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
                hoverColor: FlutterFlowTheme.of(context).accent1,
                hoverTextColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation2']!),
          ),
      ],
    );
  }
}
