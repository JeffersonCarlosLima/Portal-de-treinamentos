import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'galeria_cursos_model.dart';
export 'galeria_cursos_model.dart';

class GaleriaCursosWidget extends StatefulWidget {
  const GaleriaCursosWidget({
    super.key,
    this.cpfCliente,
    String? nomeCliente,
  }) : this.nomeCliente = nomeCliente ?? 'nome';

  final String? cpfCliente;
  final String nomeCliente;

  @override
  State<GaleriaCursosWidget> createState() => _GaleriaCursosWidgetState();
}

class _GaleriaCursosWidgetState extends State<GaleriaCursosWidget>
    with TickerProviderStateMixin {
  late GaleriaCursosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
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
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaCursosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().nomeUsuario == null || FFAppState().nomeUsuario == '') {
        context.pushNamed('loginPage');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: TreinamentoGroup.cursoCall.call(
        cpf: FFAppState().cpfUsuario,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF1F4F9),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final galeriaCursosCursoResponse = snapshot.data!;
        return YoutubeFullScreenWrapper(
          child: Title(
              title: 'Galeria de Cursos',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: WillPopScope(
                  onWillPop: () async => false,
                  child: Scaffold(
                    key: scaffoldKey,
                    backgroundColor: Color(0xFFF1F4F9),
                    drawer: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Drawer(
                        elevation: 16.0,
                        child: WebViewAware(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/softwaregep_fv_ico.png',
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 60.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/LOGO512x512.png',
                                                width: 75.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 32.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFAppState()
                                                        .nomeUsuario
                                                        .maybeHandleOverflow(
                                                            maxChars: 200),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Poppins'),
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 16.0))
                                          .addToStart(SizedBox(height: 40.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().cpfUsuario != null &&
                                            FFAppState().cpfUsuario != '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                FFAppState()
                                                    .deleteNomeUsuario();
                                                FFAppState().nomeUsuario = '';

                                                FFAppState().deleteCpfUsuario();
                                                FFAppState().cpfUsuario = '';

                                                FFAppState()
                                                    .deleteBancoUsuario();
                                                FFAppState().bancoUsuario = '';

                                                FFAppState().deleteListBancos();
                                                FFAppState().ListBancos = [];

                                                FFAppState().deleteIDcurso();
                                                FFAppState().IDcurso = 0;
                                              });

                                              context.pushNamed(
                                                'loginPage',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                  ),
                                                },
                                              );
                                            },
                                            text: 'Sair',
                                            icon: Icon(
                                              Icons.logout,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  10.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (FFAppState().cpfUsuario == null ||
                                            FFAppState().cpfUsuario == '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'loginPage',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 600),
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Entrar',
                                              icon: Icon(
                                                Icons.login,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                      ]
                                          .divide(SizedBox(height: 16.0))
                                          .addToEnd(SizedBox(height: 16.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    body: SafeArea(
                      top: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                child: ClipRRect(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 64.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 8.0, 32.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Logo-colorida.png',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.13,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 32.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Text(
                                                            'Olá!',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFF14181B),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                          Text(
                                                            FFAppState()
                                                                .nomeUsuario
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        20),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF212528),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Visibility(
                                                      visible: FFAppState()
                                                                  .cpfUsuario !=
                                                              null &&
                                                          FFAppState()
                                                                  .cpfUsuario !=
                                                              '',
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                .deleteNomeUsuario();
                                                            FFAppState()
                                                                .nomeUsuario = '';

                                                            FFAppState()
                                                                .deleteCpfUsuario();
                                                            FFAppState()
                                                                .cpfUsuario = '';

                                                            FFAppState()
                                                                .deleteBancoUsuario();
                                                            FFAppState()
                                                                .bancoUsuario = '';

                                                            FFAppState()
                                                                .deleteListBancos();
                                                            FFAppState()
                                                                .ListBancos = [];

                                                            FFAppState()
                                                                .deleteIDcurso();
                                                            FFAppState()
                                                                .IDcurso = 0;
                                                          });

                                                          context.pushNamed(
                                                            'loginPage',
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        600),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        text: 'Sair',
                                                        icon: Icon(
                                                          Icons.logout,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                child: ClipRRect(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 64.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0xFFF1F4F8),
                                              icon: Icon(
                                                Icons.menu,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0xFFF1F4F8),
                                              icon: Icon(
                                                Icons.logout_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState()
                                                      .deleteNomeUsuario();
                                                  FFAppState().nomeUsuario = '';

                                                  FFAppState()
                                                      .deleteCpfUsuario();
                                                  FFAppState().cpfUsuario = '';

                                                  FFAppState()
                                                      .deleteBancoUsuario();
                                                  FFAppState().bancoUsuario =
                                                      '';

                                                  FFAppState()
                                                      .deleteListBancos();
                                                  FFAppState().ListBancos = [];

                                                  FFAppState().deleteIDcurso();
                                                  FFAppState().IDcurso = 0;
                                                });

                                                context.pushNamed(
                                                  'loginPage',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 600),
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          valueOrDefault<
                                                                              double>(
                                                                            () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return 24.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return 24.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return 32.0;
                                                                              } else {
                                                                                return 32.0;
                                                                              }
                                                                            }(),
                                                                            0.0,
                                                                          ),
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FlutterFlowYoutubePlayer(
                                                                        url:
                                                                            '${_model.linkVideoPrincipal}',
                                                                        width:
                                                                            600.0,
                                                                        autoPlay:
                                                                            false,
                                                                        looping:
                                                                            true,
                                                                        mute:
                                                                            false,
                                                                        showControls:
                                                                            true,
                                                                        showFullScreen:
                                                                            true,
                                                                        strictRelatedVideos:
                                                                            false,
                                                                      ),
                                                                      Text(
                                                                        'Explore a excelência em treinamento com o Portal de Treinamento da Ergon Sistemas. Oferecemos cursos abrangentes e especializados para que você aprimore suas habilidades e aproveite ao máximo nossas soluções. Nossa plataforma é o seu caminho para se tornar um especialista em nosso sistema e ferramentas. ',
                                                                        textAlign:
                                                                            TextAlign.justify,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF282C2F),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Certificado',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: Color(0xFF212529),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: ' grátis',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: Color(0xFF282C2F),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: ' após a conclusão do curso',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: Color(0xFF282C2F),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: Color(0xFF282C2F),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      32.0,
                                                                      32.0,
                                                                      32.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FlutterFlowYoutubePlayer(
                                                                url:
                                                                    'https://youtu.be/BEB8SRnxGlQ',
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.4,
                                                                autoPlay: false,
                                                                looping: true,
                                                                mute: false,
                                                                showControls:
                                                                    true,
                                                                showFullScreen:
                                                                    true,
                                                                strictRelatedVideos:
                                                                    false,
                                                              ),
                                                              ClipRRect(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Excelência em Aprendizado com o Portal de Treinamento Ergon Sistemas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                color: Color(0xFF14181B),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                lineHeight: 1.3,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Explore a excelência em treinamento com o Portal de Treinamento da Ergon Sistemas. Oferecemos cursos abrangentes e especializados para que você aprimore suas habilidades e aproveite ao máximo nossas soluções. Nossa plataforma é o seu caminho para se tornar um especialista em nosso sistema e ferramentas. ',
                                                                        textAlign:
                                                                            TextAlign.justify,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF14181B),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Certificado',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: Color(0xFF14181B),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: ' grátis',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: Color(0xFF14181B),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: ' após a conclusão do curso',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: Color(0xFF14181B),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: Color(0xFF161616),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 0.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        24.0,
                                                                        32.0,
                                                                        24.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .video_camera_back_rounded,
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    size: 32.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Treinamentos do sistema GEP',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        color: Color(
                                                                            0xFF14181B),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'rowOnPageLoadAnimation']!),
                                                          ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        24.0,
                                                                        24.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .video_camera_back_sharp,
                                                                    color: Color(
                                                                        0xFF282C2F),
                                                                    size: 32.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 290.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    'Treinamentos do sistema GEP',
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                          color:
                                                                              Color(0xFF282C2F),
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              galeriaCursosCursoResponse
                                                                      .statusCode ==
                                                                  200,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final listaCurso =
                                                                    galeriaCursosCursoResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .take(5)
                                                                        .toList();
                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        listaCurso
                                                                            .length,
                                                                        (listaCursoIndex) {
                                                                      final listaCursoItem =
                                                                          listaCurso[
                                                                              listaCursoIndex];
                                                                      return Visibility(
                                                                        visible: _model.zero !=
                                                                            getJsonField(
                                                                              listaCursoItem,
                                                                              r'''$.QTDEMODULO''',
                                                                            ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              width: () {
                                                                                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                  return 250.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                  return 280.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                  return 300.0;
                                                                                } else {
                                                                                  return 300.0;
                                                                                }
                                                                              }(),
                                                                              height: 300.0,
                                                                              decoration: BoxDecoration(),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      showDialog(
                                                                                        barrierColor: Color(0x3D282C2F),
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                child: Container(
                                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  child: LoadingWidget(),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      setState(() {
                                                                                        FFAppState().IDcurso = getJsonField(
                                                                                          listaCursoItem,
                                                                                          r'''$.IDCURSO''',
                                                                                        );
                                                                                        FFAppState().nomeCursoSel = getJsonField(
                                                                                          listaCursoItem,
                                                                                          r'''$.CURSO''',
                                                                                        ).toString();
                                                                                        FFAppState().deleteListIdSubModulo();
                                                                                        FFAppState().listIdSubModulo = [];
                                                                                      });
                                                                                      await Future.delayed(const Duration(milliseconds: 300));
                                                                                      _model.listamodulos = await TreinamentoGroup.moduloCall.call(
                                                                                        idcurso: getJsonField(
                                                                                          listaCursoItem,
                                                                                          r'''$.IDCURSO''',
                                                                                        ).toString(),
                                                                                        cpf: FFAppState().cpfUsuario,
                                                                                        nomeusuario: FFAppState().nomeUsuario,
                                                                                        database: FFAppState().bancoUsuario,
                                                                                      );
                                                                                      await Future.delayed(const Duration(milliseconds: 300));
                                                                                      setState(() {
                                                                                        FFAppState().submodulo1 = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[0].SUBMENU[0].SUBMODULO''',
                                                                                        ).toString();
                                                                                        FFAppState().statusSubModulo1 = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[0].SUBMENU[0].CONCLUIDO''',
                                                                                        );
                                                                                        FFAppState().idSubModulo1 = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[0].SUBMENU[0].IDMODULO''',
                                                                                        );
                                                                                        FFAppState().linkExeternoAula = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[0].SUBMENU[0].LINKAUXILIAR''',
                                                                                        ).toString();
                                                                                        FFAppState().listIdSubModulo = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[:].SUBMENU[:].IDMODULO''',
                                                                                          true,
                                                                                        )!
                                                                                            .toList()
                                                                                            .cast<int>();
                                                                                        FFAppState().videosel1 = getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[0].SUBMENU[0].LINKVIDEO''',
                                                                                        ).toString();
                                                                                        FFAppState().listaSubmodulos = (getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[:].SUBMENU[:].SUBMODULO''',
                                                                                          true,
                                                                                        ) as List)
                                                                                            .map<String>((s) => s.toString())
                                                                                            .toList()!
                                                                                            .toList()
                                                                                            .cast<String>();
                                                                                        FFAppState().listaUrlVideo = (getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[:].SUBMENU[:].LINKVIDEO''',
                                                                                          true,
                                                                                        ) as List)
                                                                                            .map<String>((s) => s.toString())
                                                                                            .toList()!
                                                                                            .toList()
                                                                                            .cast<String>();
                                                                                        FFAppState().listaModulos = (getJsonField(
                                                                                          (_model.listamodulos?.jsonBody ?? ''),
                                                                                          r'''$.MODULOS[:].MODULO''',
                                                                                          true,
                                                                                        ) as List)
                                                                                            .map<String>((s) => s.toString())
                                                                                            .toList()!
                                                                                            .toList()
                                                                                            .cast<String>();
                                                                                      });
                                                                                      _model.resStatusNota = await TreinamentoGroup.statusCall.call(
                                                                                        idmodulo: FFAppState().idSubModulo1,
                                                                                        cpf: FFAppState().cpfUsuario,
                                                                                        nomeusuario: FFAppState().nomeUsuario,
                                                                                        database: FFAppState().bancoUsuario,
                                                                                      );
                                                                                      if ((_model.resStatusNota?.succeeded ?? true)) {
                                                                                        setState(() {
                                                                                          FFAppState().deleteNotaAula();
                                                                                          FFAppState().notaAula = 0;
                                                                                        });
                                                                                        await Future.delayed(const Duration(milliseconds: 300));
                                                                                        setState(() {
                                                                                          FFAppState().notaAula = TreinamentoGroup.statusCall.avaliacao(
                                                                                            (_model.resStatusNota?.jsonBody ?? ''),
                                                                                          )!;
                                                                                        });
                                                                                        await Future.delayed(const Duration(milliseconds: 300));
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          'coursePage',
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 600),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      }

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Card(
                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                      color: Colors.white,
                                                                                      elevation: 4.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: ClipRRect(
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    height: 140.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                        child: Image.network(
                                                                                                          getJsonField(
                                                                                                            listaCursoItem,
                                                                                                            r'''$.ICONE''',
                                                                                                          ).toString(),
                                                                                                          width: double.infinity,
                                                                                                          height: double.infinity,
                                                                                                          fit: BoxFit.fill,
                                                                                                          alignment: Alignment(0.0, -1.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    if ((_model.zero !=
                                                                                                            getJsonField(
                                                                                                              listaCursoItem,
                                                                                                              r'''$.QTDECONCLUIDO''',
                                                                                                            )) &&
                                                                                                        responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                        ))
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: LinearPercentIndicator(
                                                                                                          percent: functions.convertPorcentagemFrac(
                                                                                                              getJsonField(
                                                                                                                listaCursoItem,
                                                                                                                r'''$.QTDECONCLUIDO''',
                                                                                                              ),
                                                                                                              getJsonField(
                                                                                                                listaCursoItem,
                                                                                                                r'''$.QTDEMODULO''',
                                                                                                              ))!,
                                                                                                          width: 292.0,
                                                                                                          lineHeight: 13.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).success,
                                                                                                          backgroundColor: Color(0xFFD4D4D6),
                                                                                                          center: Text(
                                                                                                            '${functions.calculaPorcentagem(getJsonField(
                                                                                                                  listaCursoItem,
                                                                                                                  r'''$.QTDECONCLUIDO''',
                                                                                                                ), getJsonField(
                                                                                                                  listaCursoItem,
                                                                                                                  r'''$.QTDEMODULO''',
                                                                                                                )).toString()}%',
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                  color: Colors.white,
                                                                                                                  fontSize: 8.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                          barRadius: Radius.circular(0.0),
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                      ),
                                                                                                    if ((_model.zero !=
                                                                                                            getJsonField(
                                                                                                              listaCursoItem,
                                                                                                              r'''$.QTDECONCLUIDO''',
                                                                                                            )) &&
                                                                                                        responsiveVisibility(
                                                                                                          context: context,
                                                                                                          tabletLandscape: false,
                                                                                                          desktop: false,
                                                                                                        ))
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: LinearPercentIndicator(
                                                                                                            percent: functions.convertPorcentagemFrac(
                                                                                                                getJsonField(
                                                                                                                  listaCursoItem,
                                                                                                                  r'''$.QTDECONCLUIDO''',
                                                                                                                ),
                                                                                                                getJsonField(
                                                                                                                  listaCursoItem,
                                                                                                                  r'''$.QTDEMODULO''',
                                                                                                                ))!,
                                                                                                            width: 241.0,
                                                                                                            lineHeight: 13.0,
                                                                                                            animation: true,
                                                                                                            animateFromLastPercent: true,
                                                                                                            progressColor: FlutterFlowTheme.of(context).success,
                                                                                                            backgroundColor: Color(0xFFD4D4D6),
                                                                                                            center: Text(
                                                                                                              '${functions.calculaPorcentagem(getJsonField(
                                                                                                                    listaCursoItem,
                                                                                                                    r'''$.QTDECONCLUIDO''',
                                                                                                                  ), getJsonField(
                                                                                                                    listaCursoItem,
                                                                                                                    r'''$.QTDEMODULO''',
                                                                                                                  )).toString()}%',
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    fontSize: 8.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            barRadius: Radius.circular(0.0),
                                                                                                            padding: EdgeInsets.zero,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    getJsonField(
                                                                                                                      listaCursoItem,
                                                                                                                      r'''$.MEDIAAVALIACAO''',
                                                                                                                    ).toString().maybeHandleOverflow(maxChars: 5),
                                                                                                                    maxLines: 1,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          color: Color(0xFF282C2F),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Icon(
                                                                                                                  Icons.star,
                                                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                                                  size: 16.0,
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 4.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              getJsonField(
                                                                                                                listaCursoItem,
                                                                                                                r'''$.CURSO''',
                                                                                                              ).toString().maybeHandleOverflow(maxChars: 32),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                                    color: Color(0xFF282C2F),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w900,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                                  ),
                                                                                                              minFontSize: 14.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              getJsonField(
                                                                                                                listaCursoItem,
                                                                                                                r'''$.OBSERVACOES''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 150,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              maxLines: 2,
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                                    color: Color(0xFF282C2F),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                                  ),
                                                                                                              minFontSize: 12.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 0.0)).addToStart(SizedBox(height: 0.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 16.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 24.0;
                                                                      } else {
                                                                        return 24.0;
                                                                      }
                                                                    }())).around(
                                                                        SizedBox(width:
                                                                            () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 16.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 24.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 24.0;
                                                                      } else {
                                                                        return 24.0;
                                                                      }
                                                                    }())),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (galeriaCursosCursoResponse
                                                            .statusCode !=
                                                        200)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Problema ao carregar curso entre em contato com nosso suporte.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 24.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'Code: ${galeriaCursosCursoResponse.statusCode.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 24.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ]
                                                      .divide(
                                                          SizedBox(height: 0.0))
                                                      .addToEnd(SizedBox(
                                                          height: 64.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          height: 60.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Todos os direitos para © Ergon Sistemas',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF161616),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
