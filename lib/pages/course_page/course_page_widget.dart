import '/backend/api_requests/api_calls.dart';
import '/components/btn_certificado/btn_certificado_widget.dart';
import '/components/campocomentar/campocomentar_widget.dart';
import '/components/confetti_conclusao/confetti_conclusao_widget.dart';
import '/components/link_ajuda/link_ajuda_widget.dart';
import '/components/numero_nota/numero_nota_widget.dart';
import '/components/progress_course/progress_course_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'course_page_model.dart';
export 'course_page_model.dart';

class CoursePageWidget extends StatefulWidget {
  const CoursePageWidget({super.key});

  @override
  State<CoursePageWidget> createState() => _CoursePageWidgetState();
}

class _CoursePageWidgetState extends State<CoursePageWidget>
    with TickerProviderStateMixin {
  late CoursePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 1.ms,
          duration: 200.ms,
          begin: Offset(23.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeOut,
          delay: 10.ms,
          duration: 350.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'youtubePlayerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 70.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 100.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 100.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 10.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 10.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.aulaselecionada = FFAppState().submodulo1;
        _model.aulaConcluida = FFAppState().statusSubModulo1;
        _model.indexIDmodulo = FFAppState().idSubModulo1;
        _model.idModulo = FFAppState().idSubModulo1;
      });
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        FFAppState().notaAula = FFAppState().notaAula;
        FFAppState().darkMode = false;
      });
      setDarkModeSetting(
        context,
        FFAppState().darkMode ? ThemeMode.dark : ThemeMode.light,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _model.urlAula = FFAppState().videosel1;
        _model.modulosSelecionados =
            FFAppState().listaModulos.toList().cast<String>();
      });
      await Future.delayed(const Duration(milliseconds: 300));
      // Atualizabase
      setState(() {
        FFAppState().IDModuloSel = _model.idModulo!;
        FFAppState().nomeUsuarioB64 =
            functions.convertBase64toUtf8(FFAppState().nomeUsuario)!;
        FFAppState().statusAulaSel = _model.aulaConcluida!;
      });
    });

    _model.comentarioController ??= TextEditingController();
    _model.comentarioFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      future: TreinamentoGroup.moduloCall.call(
        cpf: FFAppState().cpfUsuario,
        idcurso: FFAppState().IDcurso.toString(),
        nomeusuario: FFAppState().nomeUsuario,
        database: FFAppState().bancoUsuario,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final coursePageModuloResponse = snapshot.data!;
        return YoutubeFullScreenWrapper(
          child: Title(
              title: 'Curso',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                endDrawer: Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: Drawer(
                    elevation: 16.0,
                    child: WebViewAware(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 64.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        8.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_double_arrow_right,
                                                                      color: Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .info
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      if (scaffoldKey
                                                                              .currentState!
                                                                              .isDrawerOpen ||
                                                                          scaffoldKey
                                                                              .currentState!
                                                                              .isEndDrawerOpen) {
                                                                        Navigator.pop(
                                                                            context);
                                                                      }
                                                                    },
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          175.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFAppState()
                                                                              .nomeCursoSel,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                lineHeight: 1.1,
                                                                              ),
                                                                          minFontSize:
                                                                              14.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() =>
                                                                              FFAppState().darkMode = !FFAppState().darkMode);
                                                                          if (Theme.of(context).brightness ==
                                                                              Brightness.dark) {
                                                                            setDarkModeSetting(context,
                                                                                ThemeMode.light);
                                                                          } else {
                                                                            setDarkModeSetting(context,
                                                                                ThemeMode.dark);
                                                                          }
                                                                        },
                                                                        value: !FFAppState()
                                                                            .darkMode,
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .dark_mode,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .wb_sunny_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .aulaConcluida !=
                                                              null)
                                                            wrapWithModel(
                                                              model: _model
                                                                  .progressCourseModel2,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  ProgressCourseWidget(
                                                                totalConcluido:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  TreinamentoGroup
                                                                      .moduloCall
                                                                      .qtdConcluido(
                                                                        coursePageModuloResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.first,
                                                                  0,
                                                                ),
                                                                totalModulo:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  TreinamentoGroup
                                                                      .moduloCall
                                                                      .qtdModulo(
                                                                        coursePageModuloResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.first,
                                                                  0,
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final modulosCurso =
                                                        TreinamentoGroup
                                                                .moduloCall
                                                                .modulos(
                                                                  coursePageModuloResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          modulosCurso.length,
                                                          (modulosCursoIndex) {
                                                        final modulosCursoItem =
                                                            modulosCurso[
                                                                modulosCursoIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          0.5,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: FFAppState().darkMode
                                                                                ? FlutterFlowTheme.of(context).accent3
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).primaryBackground,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (_model.modulosSelecionados.contains(getJsonField(
                                                                                  modulosCursoItem,
                                                                                  r'''$.MODULO''',
                                                                                ).toString())) {
                                                                                  setState(() {
                                                                                    _model.mostrarsubmenu = null;
                                                                                    _model.removeFromModulosSelecionados(getJsonField(
                                                                                      modulosCursoItem,
                                                                                      r'''$.MODULO''',
                                                                                    ).toString());
                                                                                  });
                                                                                } else {
                                                                                  setState(() {
                                                                                    _model.mostrarsubmenu = getJsonField(
                                                                                      modulosCursoItem,
                                                                                      r'''$.MODULO''',
                                                                                    ).toString();
                                                                                    _model.addToModulosSelecionados(getJsonField(
                                                                                      modulosCursoItem,
                                                                                      r'''$.MODULO''',
                                                                                    ).toString());
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.convertBase64toUtf8(getJsonField(
                                                                                            modulosCursoItem,
                                                                                            r'''$.MODULO''',
                                                                                          ).toString()),
                                                                                          'modulo',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (_model.modulosSelecionados.contains(getJsonField(
                                                                                        modulosCursoItem,
                                                                                        r'''$.MODULO''',
                                                                                      ).toString())) {
                                                                                        setState(() {
                                                                                          _model.removeFromModulosSelecionados(getJsonField(
                                                                                            modulosCursoItem,
                                                                                            r'''$.MODULO''',
                                                                                          ).toString());
                                                                                        });
                                                                                      } else {
                                                                                        setState(() {
                                                                                          _model.addToModulosSelecionados(getJsonField(
                                                                                            modulosCursoItem,
                                                                                            r'''$.MODULO''',
                                                                                          ).toString());
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: ToggleIcon(
                                                                                        onPressed: () async {
                                                                                          setState(
                                                                                            () => _model.modulosSelecionados.contains(getJsonField(
                                                                                              modulosCursoItem,
                                                                                              r'''$.MODULO''',
                                                                                            ).toString())
                                                                                                ? _model.removeFromModulosSelecionados(getJsonField(
                                                                                                    modulosCursoItem,
                                                                                                    r'''$.MODULO''',
                                                                                                  ).toString())
                                                                                                : _model.addToModulosSelecionados(getJsonField(
                                                                                                    modulosCursoItem,
                                                                                                    r'''$.MODULO''',
                                                                                                  ).toString()),
                                                                                          );
                                                                                        },
                                                                                        value: _model.modulosSelecionados.contains(getJsonField(
                                                                                          modulosCursoItem,
                                                                                          r'''$.MODULO''',
                                                                                        ).toString()),
                                                                                        onIcon: Icon(
                                                                                          Icons.keyboard_arrow_up_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                        offIcon: Icon(
                                                                                          Icons.keyboard_arrow_down,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 25.0,
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
                                                                  if (_model
                                                                      .modulosSelecionados
                                                                      .contains(
                                                                          getJsonField(
                                                                    modulosCursoItem,
                                                                    r'''$.MODULO''',
                                                                  ).toString()))
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final subModulos =
                                                                            getJsonField(
                                                                          modulosCursoItem,
                                                                          r'''$.SUBMENU''',
                                                                        ).toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: List.generate(
                                                                              subModulos.length,
                                                                              (subModulosIndex) {
                                                                            final subModulosItem =
                                                                                subModulos[subModulosIndex];
                                                                            return Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    var _shouldSetState = false;
                                                                                    // Este fluxo verifica o link do vídeo, e retorna o link do vídeo para a variável urlAula, atualizando o player.
                                                                                    if (_model.urlAula ==
                                                                                        getJsonField(
                                                                                          subModulosItem,
                                                                                          r'''$.LINKVIDEO''',
                                                                                        )) {
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    setState(() {
                                                                                      _model.urlAula = null;
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.nomeSubModulo = null;
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.aulaConcluida = null;
                                                                                    });
                                                                                    await Future.delayed(const Duration(milliseconds: 50));
                                                                                    setState(() {
                                                                                      _model.idModulo = null;
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.urlAula = getJsonField(
                                                                                        subModulosItem,
                                                                                        r'''$.LINKVIDEO''',
                                                                                      ).toString();
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.idModulo = getJsonField(
                                                                                        subModulosItem,
                                                                                        r'''$.IDMODULO''',
                                                                                      );
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.aulaConcluida = getJsonField(
                                                                                        subModulosItem,
                                                                                        r'''$.CONCLUIDO''',
                                                                                      );
                                                                                    });
                                                                                    setState(() {
                                                                                      _model.nomeSubModulo = getJsonField(
                                                                                        subModulosItem,
                                                                                        r'''$.SUBMODULO''',
                                                                                      ).toString();
                                                                                    });
                                                                                    _model.resStatusNotaSubModuloM = await TreinamentoGroup.statusCall.call(
                                                                                      idmodulo: _model.idModulo,
                                                                                      cpf: FFAppState().cpfUsuario,
                                                                                      nomeusuario: FFAppState().nomeUsuario,
                                                                                      database: FFAppState().bancoUsuario,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if ((_model.resStatusNotaSubModuloM?.succeeded ?? true)) {
                                                                                      setState(() {
                                                                                        FFAppState().deleteNotaAula();
                                                                                        FFAppState().notaAula = 0;
                                                                                      });
                                                                                      setState(() {
                                                                                        FFAppState().notaAula = TreinamentoGroup.statusCall.avaliacao(
                                                                                          (_model.resStatusNotaSubModuloM?.jsonBody ?? ''),
                                                                                        )!;
                                                                                      });
                                                                                    }
                                                                                    if (_model.aulaselecionada ==
                                                                                        getJsonField(
                                                                                          subModulosItem,
                                                                                          r'''$.SUBMODULO''',
                                                                                        )) {
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    setState(() {
                                                                                      _model.aulaselecionada = getJsonField(
                                                                                        subModulosItem,
                                                                                        r'''$.SUBMODULO''',
                                                                                      ).toString();
                                                                                    });
                                                                                    if (scaffoldKey.currentState!.isDrawerOpen || scaffoldKey.currentState!.isEndDrawerOpen) {
                                                                                      Navigator.pop(context);
                                                                                    }

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 0.5,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(8.0),
                                                                                        bottomRight: Radius.circular(8.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: AnimatedContainer(
                                                                                      duration: Duration(milliseconds: 100),
                                                                                      curve: Curves.bounceOut,
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: () {
                                                                                          if (_model.aulaselecionada ==
                                                                                              getJsonField(
                                                                                                subModulosItem,
                                                                                                r'''$.SUBMODULO''',
                                                                                              )) {
                                                                                            return FlutterFlowTheme.of(context).primary;
                                                                                          } else if (Theme.of(context).brightness == Brightness.dark) {
                                                                                            return FlutterFlowTheme.of(context).accent4;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                          }
                                                                                        }(),
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(8.0),
                                                                                          bottomRight: Radius.circular(8.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Icon(
                                                                                                          Icons.play_circle,
                                                                                                          color: _model.aulaselecionada ==
                                                                                                                  getJsonField(
                                                                                                                    subModulosItem,
                                                                                                                    r'''$.SUBMODULO''',
                                                                                                                  )
                                                                                                              ? FlutterFlowTheme.of(context).info
                                                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                  child: ClipRRect(
                                                                                                                    child: Container(
                                                                                                                      width: 211.0,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            functions.convertBase64toUtf8(getJsonField(
                                                                                                                              subModulosItem,
                                                                                                                              r'''$.SUBMODULO''',
                                                                                                                            ).toString()),
                                                                                                                            'submodulo',
                                                                                                                          ).maybeHandleOverflow(maxChars: 250),
                                                                                                                          textAlign: TextAlign.justify,
                                                                                                                          maxLines: 2,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                color: _model.aulaselecionada ==
                                                                                                                                        getJsonField(
                                                                                                                                          subModulosItem,
                                                                                                                                          r'''$.SUBMODULO''',
                                                                                                                                        )
                                                                                                                                    ? FlutterFlowTheme.of(context).info
                                                                                                                                    : FlutterFlowTheme.of(context).primaryText,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    functions.convertBase64toUtf8(getJsonField(
                                                                                                                      subModulosItem,
                                                                                                                      r'''$.TEMPO''',
                                                                                                                    ).toString()),
                                                                                                                    'tempoAula',
                                                                                                                  ),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  maxLines: 1,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: () {
                                                                                                                          if (_model.aulaselecionada ==
                                                                                                                              getJsonField(
                                                                                                                                subModulosItem,
                                                                                                                                r'''$.SUBMODULO''',
                                                                                                                              )) {
                                                                                                                            return FlutterFlowTheme.of(context).info;
                                                                                                                          } else if (Theme.of(context).brightness == Brightness.dark) {
                                                                                                                            return FlutterFlowTheme.of(context).info;
                                                                                                                          } else {
                                                                                                                            return FlutterFlowTheme.of(context).accent3;
                                                                                                                          }
                                                                                                                        }(),
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (getJsonField(
                                                                                                          subModulosItem,
                                                                                                          r'''$.CONCLUIDO''',
                                                                                                        ))
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Icon(
                                                                                                              Icons.check_circle_outline_sharp,
                                                                                                              color: _model.aulaselecionada ==
                                                                                                                      getJsonField(
                                                                                                                        subModulosItem,
                                                                                                                        r'''$.SUBMODULO''',
                                                                                                                      )
                                                                                                                  ? FlutterFlowTheme.of(context).info
                                                                                                                  : FlutterFlowTheme.of(context).success,
                                                                                                              size: 28.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (!getJsonField(
                                                                                                          subModulosItem,
                                                                                                          r'''$.CONCLUIDO''',
                                                                                                        ))
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Icon(
                                                                                                              Icons.radio_button_off,
                                                                                                              color: _model.aulaselecionada ==
                                                                                                                      getJsonField(
                                                                                                                        subModulosItem,
                                                                                                                        r'''$.SUBMODULO''',
                                                                                                                      )
                                                                                                                  ? FlutterFlowTheme.of(context).info
                                                                                                                  : FlutterFlowTheme.of(context).accent3,
                                                                                                              size: 28.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                              ),
                                                                            );
                                                                          }).divide(SizedBox(height: 8.0)).around(
                                                                              SizedBox(height: 8.0)),
                                                                        );
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : FlutterFlowTheme.of(context)
                                              .accent4,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 64.0),
                                        child: wrapWithModel(
                                          model: _model.btnCertificadoModel2,
                                          updateCallback: () => setState(() {}),
                                          child: BtnCertificadoWidget(
                                            totalConcluido: valueOrDefault<int>(
                                              TreinamentoGroup.moduloCall
                                                  .qtdConcluido(
                                                    coursePageModuloResponse
                                                        .jsonBody,
                                                  )
                                                  ?.first,
                                              0,
                                            ),
                                            totalModulo: valueOrDefault<int>(
                                              TreinamentoGroup.moduloCall
                                                  .qtdModulo(
                                                    coursePageModuloResponse
                                                        .jsonBody,
                                                  )
                                                  ?.first,
                                              0,
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
                        ),
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    child: Container(
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 24.0;
                                                } else {
                                                  return 24.0;
                                                }
                                              }(),
                                              0.0,
                                            ),
                                            8.0,
                                            valueOrDefault<double>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 24.0;
                                                } else {
                                                  return 24.0;
                                                }
                                              }(),
                                              0.0,
                                            ),
                                            8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Text(
                                                      'Voltar',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_backspace_rounded,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .info
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        'galeriaCursos');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                child: Container(
                                                  width: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 200.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 400.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 480.0;
                                                    } else {
                                                      return 500.0;
                                                    }
                                                  }(),
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .convertBase64toUtf8(
                                                                _model
                                                                    .aulaselecionada),
                                                        'nomeAula',
                                                      ).maybeHandleOverflow(
                                                          maxChars: 200),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_double_arrow_left,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .info
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      scaffoldKey.currentState!
                                                          .openEndDrawer();
                                                    },
                                                  ),
                                                MouseRegion(
                                                  opaque: false,
                                                  cursor: MouseCursor.defer ??
                                                      MouseCursor.defer,
                                                  child: Container(
                                                    decoration: BoxDecoration(
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
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        // recolhe menu
                                                        setState(() {
                                                          _model.closeMenu =
                                                              false;
                                                        });
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  1.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if ((_model.closeMenu ==
                                                                      true) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_double_arrow_left,
                                                                    color: Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .info
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'menuCurso pressed ...');
                                                                  },
                                                                ),
                                                              if ((_model.mostrarMenuHovered ??
                                                                      true) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Mostrar Aulas',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color: Theme.of(context).brightness == Brightness.dark
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation']!),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onEnter: ((event) async {
                                                    setState(() => _model
                                                            .mostrarMenuHovered =
                                                        true);
                                                  }),
                                                  onExit: ((event) async {
                                                    setState(() => _model
                                                            .mostrarMenuHovered =
                                                        false);
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: ClipRRect(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 1280.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Visibility(
                                          visible: _model.urlAula != null &&
                                              _model.urlAula != '',
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowYoutubePlayer(
                                                        url:
                                                            '${_model.urlAula}',
                                                        width: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 320.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 480.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 640.0;
                                                          } else {
                                                            return 700.0;
                                                          }
                                                        }(),
                                                        height: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 240.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 300.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 380.0;
                                                          } else {
                                                            return 380.0;
                                                          }
                                                        }(),
                                                        autoPlay: false,
                                                        looping: true,
                                                        mute: false,
                                                        showControls: true,
                                                        showFullScreen: true,
                                                        strictRelatedVideos:
                                                            false,
                                                      ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'youtubePlayerOnPageLoadAnimation']!),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
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
                                                          child: MouseRegion(
                                                            opaque: false,
                                                            cursor: MouseCursor
                                                                    .defer ??
                                                                MouseCursor
                                                                    .defer,
                                                            child: Visibility(
                                                              visible: FFAppState()
                                                                      .listaSubmodulos
                                                                      .first !=
                                                                  _model
                                                                      .aulaselecionada,
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (_model
                                                                          .aulaselecionada ==
                                                                      _model
                                                                          .aulaselecionada) {
                                                                    setState(
                                                                        () {
                                                                      _model.indexSubmodulo =
                                                                          _model
                                                                              .aulaselecionada;
                                                                      _model.indexUrlVideo =
                                                                          _model
                                                                              .urlAula;
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            300));
                                                                    setState(
                                                                        () {
                                                                      _model.indexSubmodulo = functions
                                                                          .percorrerListaUP(
                                                                              FFAppState().listaSubmodulos.toList(),
                                                                              _model.indexSubmodulo)
                                                                          ?.first;
                                                                      _model.indexUrlVideo = functions
                                                                          .percorrerListaUP(
                                                                              FFAppState().listaUrlVideo.toList(),
                                                                              _model.indexUrlVideo)
                                                                          ?.first;
                                                                      _model.indexIDmodulo = functions
                                                                          .percorrerListaUPint(
                                                                              FFAppState().listIdSubModulo.toList(),
                                                                              _model.indexIDmodulo)
                                                                          ?.first;
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            300));
                                                                    // removeDadosVariaveis
                                                                    setState(
                                                                        () {
                                                                      _model.aulaselecionada =
                                                                          null;
                                                                      _model.urlAula =
                                                                          null;
                                                                      _model.aulaConcluida =
                                                                          null;
                                                                      _model.idModulo =
                                                                          null;
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            300));
                                                                    setState(
                                                                        () {
                                                                      _model.aulaselecionada =
                                                                          _model
                                                                              .indexSubmodulo;
                                                                      _model.urlAula =
                                                                          _model
                                                                              .indexUrlVideo;
                                                                      _model.idModulo =
                                                                          _model
                                                                              .indexIDmodulo;
                                                                    });
                                                                    _model.resStatusUP =
                                                                        await TreinamentoGroup
                                                                            .statusCall
                                                                            .call(
                                                                      idmodulo:
                                                                          _model
                                                                              .idModulo,
                                                                      cpf: FFAppState()
                                                                          .cpfUsuario,
                                                                      nomeusuario:
                                                                          FFAppState()
                                                                              .nomeUsuario,
                                                                      database:
                                                                          FFAppState()
                                                                              .bancoUsuario,
                                                                    );
                                                                    if ((_model
                                                                            .resStatusUP
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .deleteNotaAula();
                                                                        FFAppState()
                                                                            .notaAula = 0;
                                                                      });
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                      setState(
                                                                          () {
                                                                        FFAppState().notaAula = TreinamentoGroup
                                                                            .statusCall
                                                                            .avaliacao(
                                                                          (_model.resStatusUP?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                      });
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                      setState(
                                                                          () {
                                                                        _model.aulaConcluida = TreinamentoGroup
                                                                            .statusCall
                                                                            .status(
                                                                          (_model.resStatusUP?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                      });
                                                                    }
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 160.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 160.0;
                                                                      } else {
                                                                        return 160.0;
                                                                      }
                                                                    }(),
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (_model
                                                                            .btbackHovered!) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if (Theme.of(context).brightness ==
                                                                            Brightness.dark) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .alternate;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        // Nesta ROW foi implementado um redimensionamento dinâmico para ajustar conforme a dimensão do dispositivo.
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.chevron_left,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                'Aula anterior',
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            onEnter:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.btbackHovered =
                                                                      true);
                                                            }),
                                                            onExit:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.btbackHovered =
                                                                      false);
                                                            }),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 150.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (_model
                                                                        .aulaConcluida ==
                                                                    false)
                                                                  Builder(
                                                                    builder: (context) =>
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.btnConcluir = await TreinamentoGroup
                                                                            .pOSTStatusModuloCall
                                                                            .call(
                                                                          idmodulo:
                                                                              _model.idModulo,
                                                                          cpf: FFAppState()
                                                                              .cpfUsuario,
                                                                          nomeuserb64:
                                                                              FFAppState().nomeUsuarioB64,
                                                                          concluido:
                                                                              true,
                                                                          avaliacao:
                                                                              FFAppState().notaAula,
                                                                          database:
                                                                              FFAppState().bancoUsuario,
                                                                        );
                                                                        if ((_model.btnConcluir?.succeeded ??
                                                                            true)) {
                                                                          setState(
                                                                              () {
                                                                            _model.aulaConcluida =
                                                                                true;
                                                                          });
                                                                          await showAlignedDialog(
                                                                            barrierColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                false,
                                                                            avoidOverflow:
                                                                                false,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: WebViewAware(
                                                                                  child: ConfettiConclusaoWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
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
                                                                                    content: Text('Existe um problemas ao se conectar com o servidor, verifique a sua conexão coma a internet, e tente novamente.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Concluir',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .radio_button_off,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        hoverColor:
                                                                            FlutterFlowTheme.of(context).accent1,
                                                                        hoverTextColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                            animationsMap[
                                                                                'buttonOnActionTriggerAnimation']!,
                                                                            hasBeenTriggered:
                                                                                hasButtonTriggered),
                                                                  ),
                                                                if (_model
                                                                        .aulaConcluida ==
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.desConcluir = await TreinamentoGroup
                                                                            .pOSTStatusModuloCall
                                                                            .call(
                                                                          idmodulo:
                                                                              _model.idModulo,
                                                                          cpf: FFAppState()
                                                                              .cpfUsuario,
                                                                          nomeuserb64:
                                                                              FFAppState().nomeUsuarioB64,
                                                                          concluido:
                                                                              false,
                                                                          avaliacao:
                                                                              FFAppState().notaAula,
                                                                          database:
                                                                              FFAppState().bancoUsuario,
                                                                        );
                                                                        if ((_model.desConcluir?.succeeded ??
                                                                            true)) {
                                                                          setState(
                                                                              () {
                                                                            _model.aulaConcluida =
                                                                                false;
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
                                                                                    content: Text('Existe um problemas ao se conectar com o servidor, verifique a sua conexão coma a internet, e tente novamente.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Concluído',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        hoverColor:
                                                                            Color(0xFF1A665D),
                                                                        hoverTextColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['buttonOnPageLoadAnimation']!),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: MouseRegion(
                                                            opaque: false,
                                                            cursor: MouseCursor
                                                                    .defer ??
                                                                MouseCursor
                                                                    .defer,
                                                            child: Visibility(
                                                              visible: FFAppState()
                                                                      .listaSubmodulos
                                                                      .last !=
                                                                  _model
                                                                      .aulaselecionada,
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (_model
                                                                          .aulaselecionada ==
                                                                      _model
                                                                          .aulaselecionada) {
                                                                    setState(
                                                                        () {
                                                                      _model.indexSubmodulo =
                                                                          _model
                                                                              .aulaselecionada;
                                                                      _model.indexUrlVideo =
                                                                          _model
                                                                              .urlAula;
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            200));
                                                                    setState(
                                                                        () {
                                                                      _model.indexSubmodulo = functions
                                                                          .percorrerListaDown(
                                                                              FFAppState().listaSubmodulos.toList(),
                                                                              _model.indexSubmodulo)
                                                                          ?.first;
                                                                      _model.indexUrlVideo = functions
                                                                          .percorrerListaDown(
                                                                              FFAppState().listaUrlVideo.toList(),
                                                                              _model.indexUrlVideo)
                                                                          ?.first;
                                                                      _model.indexIDmodulo = functions
                                                                          .percorrerListaDownint(
                                                                              FFAppState().listIdSubModulo.toList(),
                                                                              _model.indexIDmodulo)
                                                                          ?.first;
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            200));
                                                                    // removeDadosVariaveis
                                                                    setState(
                                                                        () {
                                                                      _model.aulaselecionada =
                                                                          null;
                                                                      _model.urlAula =
                                                                          null;
                                                                      _model.idModulo =
                                                                          null;
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .deleteLinkExeternoAula();
                                                                      FFAppState()
                                                                          .linkExeternoAula = '';
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            200));
                                                                    setState(
                                                                        () {
                                                                      _model.aulaselecionada =
                                                                          _model
                                                                              .indexSubmodulo;
                                                                      _model.urlAula =
                                                                          _model
                                                                              .indexUrlVideo;
                                                                      _model.idModulo =
                                                                          _model
                                                                              .indexIDmodulo;
                                                                    });
                                                                    _model.resStatusDown =
                                                                        await TreinamentoGroup
                                                                            .statusCall
                                                                            .call(
                                                                      idmodulo:
                                                                          _model
                                                                              .idModulo,
                                                                      cpf: FFAppState()
                                                                          .cpfUsuario,
                                                                      nomeusuario:
                                                                          FFAppState()
                                                                              .nomeUsuario,
                                                                      database:
                                                                          FFAppState()
                                                                              .bancoUsuario,
                                                                    );
                                                                    if ((_model
                                                                            .resStatusDown
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .deleteNotaAula();
                                                                        FFAppState()
                                                                            .notaAula = 0;
                                                                      });
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                      setState(
                                                                          () {
                                                                        _model.aulaConcluida = TreinamentoGroup
                                                                            .statusCall
                                                                            .status(
                                                                          (_model.resStatusDown?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                      });
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                      setState(
                                                                          () {
                                                                        FFAppState().notaAula = TreinamentoGroup
                                                                            .statusCall
                                                                            .avaliacao(
                                                                          (_model.resStatusDown?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                      });
                                                                    }
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 60.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 160.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 160.0;
                                                                      } else {
                                                                        return 160.0;
                                                                      }
                                                                    }(),
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (_model
                                                                            .btNextHovered!) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        } else if (Theme.of(context).brightness ==
                                                                            Brightness.dark) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .alternate;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryBackground;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Próxima aula',
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          Icon(
                                                                            Icons.navigate_next,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            onEnter:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.btNextHovered =
                                                                      true);
                                                            }),
                                                            onExit:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.btNextHovered =
                                                                      false);
                                                            }),
                                                          ),
                                                        ),
                                                        AlignedTooltip(
                                                          content: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                'Ajuda',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              )),
                                                          offset: 4.0,
                                                          preferredDirection:
                                                              AxisDirection
                                                                  .down,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          elevation: 4.0,
                                                          tailBaseWidth: 24.0,
                                                          tailLength: 12.0,
                                                          waitDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          showDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      1500),
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .tap,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .linkAjudaModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                LinkAjudaWidget(),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 16.0)),
                                                    ),
                                                  ),
                                                  if (_model.urlAula != null &&
                                                      _model.urlAula != '')
                                                    Divider(
                                                      height: 10.0,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  if (_model.urlAula != null &&
                                                      _model.urlAula != '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  16.0,
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  24.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                1.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 12.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 16.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 16.0;
                                                                        } else {
                                                                          return 16.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 12.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 16.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 16.0;
                                                                        } else {
                                                                          return 16.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 12.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 16.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 16.0;
                                                                        } else {
                                                                          return 16.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 12.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 16.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 16.0;
                                                                        } else {
                                                                          return 16.0;
                                                                        }
                                                                      }(),
                                                                      0.0,
                                                                    )),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Avalie nossa aula',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      AlignedTooltip(
                                                                    content: Padding(
                                                                        padding: EdgeInsets.all(4.0),
                                                                        child: Text(
                                                                          'Avalie nossa aula',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                              ),
                                                                        )),
                                                                    offset: 4.0,
                                                                    preferredDirection:
                                                                        AxisDirection
                                                                            .down,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    elevation:
                                                                        4.0,
                                                                    tailBaseWidth:
                                                                        24.0,
                                                                    tailLength:
                                                                        12.0,
                                                                    waitDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                100),
                                                                    showDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                1500),
                                                                    triggerMode:
                                                                        TooltipTriggerMode
                                                                            .tap,
                                                                    child:
                                                                        Visibility(
                                                                      visible: _model.urlAula !=
                                                                              null &&
                                                                          _model.urlAula !=
                                                                              '',
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final nota =
                                                                                _model.listNota.toList();
                                                                            return SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(nota.length, (notaIndex) {
                                                                                  final notaItem = nota[notaIndex];
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      // RESET NOTA
                                                                                      setState(() {
                                                                                        FFAppState().deleteNotaAula();
                                                                                        FFAppState().notaAula = 0;
                                                                                      });
                                                                                      await Future.delayed(const Duration(milliseconds: 100));
                                                                                      // INSERT NOTA
                                                                                      setState(() {
                                                                                        FFAppState().notaAula = notaItem;
                                                                                      });
                                                                                      await Future.delayed(const Duration(milliseconds: 100));
                                                                                      _model.postNota = await TreinamentoGroup.pOSTStatusModuloCall.call(
                                                                                        idmodulo: _model.idModulo,
                                                                                        cpf: FFAppState().cpfUsuario,
                                                                                        nomeuserb64: FFAppState().nomeUsuarioB64,
                                                                                        concluido: _model.aulaConcluida,
                                                                                        avaliacao: FFAppState().notaAula,
                                                                                        database: FFAppState().bancoUsuario,
                                                                                      );
                                                                                      if ((_model.postNota?.succeeded ?? true)) {
                                                                                        await Future.delayed(const Duration(milliseconds: 100));
                                                                                        _model.resStatusNotaClik = await TreinamentoGroup.statusCall.call(
                                                                                          idmodulo: _model.idModulo,
                                                                                          cpf: FFAppState().cpfUsuario,
                                                                                          nomeusuario: FFAppState().nomeUsuario,
                                                                                          database: FFAppState().bancoUsuario,
                                                                                        );
                                                                                        if ((_model.resStatusNotaClik?.succeeded ?? true)) {
                                                                                          setState(() {
                                                                                            FFAppState().deleteNotaAula();
                                                                                            FFAppState().notaAula = 0;
                                                                                          });
                                                                                          await Future.delayed(const Duration(milliseconds: 100));
                                                                                          setState(() {
                                                                                            FFAppState().notaAula = TreinamentoGroup.statusCall.avaliacao(
                                                                                              (_model.resStatusNotaClik?.jsonBody ?? ''),
                                                                                            )!;
                                                                                          });
                                                                                        }
                                                                                      }

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.numeroNotaModels.getModel(
                                                                                        notaItem.toString(),
                                                                                        notaIndex,
                                                                                      ),
                                                                                      updateCallback: () => setState(() {}),
                                                                                      child: NumeroNotaWidget(
                                                                                        key: Key(
                                                                                          'Key7d2_${notaItem.toString()}',
                                                                                        ),
                                                                                        notalist: notaItem,
                                                                                        notares: FFAppState().notaAula,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(SizedBox(width: () {
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                    return 0.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                    return 8.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                    return 8.0;
                                                                                  } else {
                                                                                    return 16.0;
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
                                                                Text(
                                                                  'Faça um comentário',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .comentarioController,
                                                                    focusNode:
                                                                        _model
                                                                            .comentarioFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .none,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .send,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          false,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            color:
                                                                                Color(0xFF2A2A2A),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                      alignLabelWithHint:
                                                                          false,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              Color(0xFF161616),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                    maxLines: 4,
                                                                    minLines:
                                                                        null,
                                                                    maxLength:
                                                                        600,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .multiline,
                                                                    validator: _model
                                                                        .comentarioControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.verificaComentario =
                                                                          await actions
                                                                              .verificaComentario(
                                                                        _model
                                                                            .comentarioController
                                                                            .text,
                                                                      );
                                                                      if (_model
                                                                              .verificaComentario ==
                                                                          true) {
                                                                        setState(
                                                                            () {
                                                                          _model.comentariob64 = _model
                                                                              .comentarioController
                                                                              .text;
                                                                        });
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                600));
                                                                        _model.comentarioPost = await TreinamentoGroup
                                                                            .pOSTComentarioCall
                                                                            .call(
                                                                          idmodulo:
                                                                              _model.idModulo,
                                                                          cpf: FFAppState()
                                                                              .cpfUsuario,
                                                                          nomebase64:
                                                                              functions.convertStringToBase64(FFAppState().nomeUsuario),
                                                                          database:
                                                                              FFAppState().bancoUsuario,
                                                                          mensagemb64:
                                                                              functions.convertStringToBase64(_model.comentariob64),
                                                                        );
                                                                        if ((_model.comentarioPost?.succeeded ??
                                                                            true)) {
                                                                          setState(
                                                                              () {
                                                                            _model.comentarioController?.clear();
                                                                          });
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Comentário realizado com sucesso!',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                          );
                                                                        }
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Por favor, insira um comentário antes de prosseguir.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).warning,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Comentar',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .send,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation1']!),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                    }(),
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                    }(),
                                                                    0.0,
                                                                  )),
                                                      child: Text(
                                                        'Comentários',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: TreinamentoGroup
                                                            .comentariosCall
                                                            .call(
                                                          idmodulo:
                                                              _model.idModulo,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitFadingCube(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final commentSendsComentariosResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final comentariosClientes =
                                                                  TreinamentoGroup
                                                                          .comentariosCall
                                                                          .comentario(
                                                                            commentSendsComentariosResponse.jsonBody,
                                                                          )
                                                                          ?.toList() ??
                                                                      [];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                        comentariosClientes
                                                                            .length,
                                                                        (comentariosClientesIndex) {
                                                                  final comentariosClientesItem =
                                                                      comentariosClientes[
                                                                          comentariosClientesIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().cpfUsuario ==
                                                                                            getJsonField(
                                                                                              comentariosClientesItem,
                                                                                              r'''$.CPF''',
                                                                                            )
                                                                                        ? -1.0
                                                                                        : 1.0,
                                                                                    0.0,
                                                                                  ),
                                                                                  0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                                                    valueOrDefault<double>(
                                                                                      () {
                                                                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                          return 16.0;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                          return 16.0;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                          return 24.0;
                                                                                        } else {
                                                                                          return 24.0;
                                                                                        }
                                                                                      }(),
                                                                                      0.0,
                                                                                    ),
                                                                                    0.0,
                                                                                    valueOrDefault<double>(
                                                                                      () {
                                                                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                          return 16.0;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                          return 16.0;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                          return 24.0;
                                                                                        } else {
                                                                                          return 24.0;
                                                                                        }
                                                                                      }(),
                                                                                      0.0,
                                                                                    ),
                                                                                    0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: FFAppState().cpfUsuario ==
                                                                                                getJsonField(
                                                                                                  comentariosClientesItem,
                                                                                                  r'''$.CPF''',
                                                                                                )
                                                                                            ? Color(0x29E142FF)
                                                                                            : Color(0x23282C2F),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                            0.0,
                                                                                                            0.0,
                                                                                                            0.0,
                                                                                                            valueOrDefault<double>(
                                                                                                              getJsonField(
                                                                                                                        comentariosClientesItem,
                                                                                                                        r'''$.RESPOSTAS''',
                                                                                                                      ) ==
                                                                                                                      null
                                                                                                                  ? 8.0
                                                                                                                  : 0.0,
                                                                                                              0.0,
                                                                                                            )),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                    child: Icon(
                                                                                                                      Icons.person_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                                      size: 32.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.convertBase64toUtf8(getJsonField(
                                                                                                                        comentariosClientesItem,
                                                                                                                        r'''$.NOME''',
                                                                                                                      ).toString()),
                                                                                                                      'USUARIOGEP',
                                                                                                                    ).maybeHandleOverflow(maxChars: 60),
                                                                                                                    textAlign: TextAlign.start,
                                                                                                                    maxLines: 1,
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                    child: Text(
                                                                                                                      getJsonField(
                                                                                                                        comentariosClientesItem,
                                                                                                                        r'''$.DATAHORA''',
                                                                                                                      ).toString(),
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.convertBase64toUtf8(getJsonField(
                                                                                                      comentariosClientesItem,
                                                                                                      r'''$.MENSAGEM''',
                                                                                                    ).toString()),
                                                                                                    'MENSAGEM',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.justify,
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 0.5,
                                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(),
                                                                                              ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                              ))
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (_model.lerSubComentarios !=
                                                                                                            getJsonField(
                                                                                                              comentariosClientesItem,
                                                                                                              r'''$.IDCOMENTARIO''',
                                                                                                            ))
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: (functions
                                                                                                                          .contaArrey(getJsonField(
                                                                                                                            comentariosClientesItem,
                                                                                                                            r'''$.RESPOSTAS''',
                                                                                                                          ))
                                                                                                                          .toString() ==
                                                                                                                      '0')
                                                                                                                  ? null
                                                                                                                  : () async {
                                                                                                                      setState(() {
                                                                                                                        _model.lerSubComentarios = getJsonField(
                                                                                                                          comentariosClientesItem,
                                                                                                                          r'''$.IDCOMENTARIO''',
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                              text: 'Ver Respostas(${functions.contaArrey(getJsonField(
                                                                                                                    comentariosClientesItem,
                                                                                                                    r'''$.RESPOSTAS''',
                                                                                                                  )).toString()})',
                                                                                                              icon: Icon(
                                                                                                                Icons.keyboard_arrow_down,
                                                                                                                size: 15.0,
                                                                                                              ),
                                                                                                              options: FFButtonOptions(
                                                                                                                height: 30.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Colors.transparent,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                disabledTextColor: FlutterFlowTheme.of(context).accent3,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (_model.lerSubComentarios ==
                                                                                                            getJsonField(
                                                                                                              comentariosClientesItem,
                                                                                                              r'''$.IDCOMENTARIO''',
                                                                                                            ))
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                setState(() {
                                                                                                                  _model.lerSubComentarios = 0;
                                                                                                                });
                                                                                                              },
                                                                                                              text: 'Ocultar respostas',
                                                                                                              icon: Icon(
                                                                                                                Icons.keyboard_arrow_up_sharp,
                                                                                                                size: 15.0,
                                                                                                              ),
                                                                                                              options: FFButtonOptions(
                                                                                                                height: 30.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Colors.transparent,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (FFAppState().responderComentario != null)
                                                                                                      FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          setState(() {
                                                                                                            FFAppState().responderComentario = getJsonField(
                                                                                                              comentariosClientesItem,
                                                                                                              r'''$.IDCOMENTARIO''',
                                                                                                            );
                                                                                                          });
                                                                                                        },
                                                                                                        text: 'Responder',
                                                                                                        icon: Icon(
                                                                                                          Icons.reply_rounded,
                                                                                                          size: 15.0,
                                                                                                        ),
                                                                                                        options: FFButtonOptions(
                                                                                                          height: 40.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                              ),
                                                                                                          elevation: 0.0,
                                                                                                          borderSide: BorderSide(
                                                                                                            color: Colors.transparent,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                      ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                tabletLandscape: false,
                                                                                                desktop: false,
                                                                                              ))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            if (_model.lerSubComentarios !=
                                                                                                                getJsonField(
                                                                                                                  comentariosClientesItem,
                                                                                                                  r'''$.IDCOMENTARIO''',
                                                                                                                ))
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: FFButtonWidget(
                                                                                                                  onPressed: (functions
                                                                                                                              .contaArrey(getJsonField(
                                                                                                                                comentariosClientesItem,
                                                                                                                                r'''$.RESPOSTAS''',
                                                                                                                              ))
                                                                                                                              .toString() ==
                                                                                                                          '0')
                                                                                                                      ? null
                                                                                                                      : () async {
                                                                                                                          setState(() {
                                                                                                                            _model.lerSubComentarios = getJsonField(
                                                                                                                              comentariosClientesItem,
                                                                                                                              r'''$.IDCOMENTARIO''',
                                                                                                                            );
                                                                                                                          });
                                                                                                                        },
                                                                                                                  text: '(${functions.contaArrey(getJsonField(
                                                                                                                        comentariosClientesItem,
                                                                                                                        r'''$.RESPOSTAS''',
                                                                                                                      )).toString()})',
                                                                                                                  icon: Icon(
                                                                                                                    Icons.keyboard_arrow_down,
                                                                                                                    size: 32.0,
                                                                                                                  ),
                                                                                                                  options: FFButtonOptions(
                                                                                                                    height: 30.0,
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                        ),
                                                                                                                    elevation: 0.0,
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.transparent,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    disabledTextColor: FlutterFlowTheme.of(context).accent3,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (_model.lerSubComentarios ==
                                                                                                                getJsonField(
                                                                                                                  comentariosClientesItem,
                                                                                                                  r'''$.IDCOMENTARIO''',
                                                                                                                ))
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: FFButtonWidget(
                                                                                                                  onPressed: () async {
                                                                                                                    setState(() {
                                                                                                                      _model.lerSubComentarios = 0;
                                                                                                                    });
                                                                                                                  },
                                                                                                                  text: '',
                                                                                                                  icon: Icon(
                                                                                                                    Icons.keyboard_arrow_up_sharp,
                                                                                                                    size: 32.0,
                                                                                                                  ),
                                                                                                                  options: FFButtonOptions(
                                                                                                                    height: 30.0,
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                        ),
                                                                                                                    elevation: 0.0,
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.transparent,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (FFAppState().responderComentario != null)
                                                                                                              FFButtonWidget(
                                                                                                                onPressed: () async {
                                                                                                                  setState(() {
                                                                                                                    FFAppState().responderComentario = getJsonField(
                                                                                                                      comentariosClientesItem,
                                                                                                                      r'''$.IDCOMENTARIO''',
                                                                                                                    );
                                                                                                                  });
                                                                                                                },
                                                                                                                text: '',
                                                                                                                icon: Icon(
                                                                                                                  Icons.comment_bank,
                                                                                                                  size: 15.0,
                                                                                                                ),
                                                                                                                options: FFButtonOptions(
                                                                                                                  height: 40.0,
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                  color: Color(0x00FFFFFF),
                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                      ),
                                                                                                                  elevation: 0.0,
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Colors.transparent,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                  hoverTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (FFAppState().responderComentario ==
                                                                                getJsonField(
                                                                                  comentariosClientesItem,
                                                                                  r'''$.IDCOMENTARIO''',
                                                                                ))
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                                          valueOrDefault<double>(
                                                                                            () {
                                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                return 16.0;
                                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                return 48.0;
                                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                return 48.0;
                                                                                              } else {
                                                                                                return 48.0;
                                                                                              }
                                                                                            }(),
                                                                                            0.0,
                                                                                          ),
                                                                                          8.0,
                                                                                          valueOrDefault<double>(
                                                                                            () {
                                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                return 16.0;
                                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                return 48.0;
                                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                return 48.0;
                                                                                              } else {
                                                                                                return 48.0;
                                                                                              }
                                                                                            }(),
                                                                                            0.0,
                                                                                          ),
                                                                                          8.0),
                                                                                      child: wrapWithModel(
                                                                                        model: _model.campocomentarModels.getModel(
                                                                                          getJsonField(
                                                                                            comentariosClientesItem,
                                                                                            r'''$.IDCOMENTARIO''',
                                                                                          ).toString(),
                                                                                          comentariosClientesIndex,
                                                                                        ),
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: CampocomentarWidget(
                                                                                          key: Key(
                                                                                            'Keyztz_${getJsonField(
                                                                                              comentariosClientesItem,
                                                                                              r'''$.IDCOMENTARIO''',
                                                                                            ).toString()}',
                                                                                          ),
                                                                                          idComentariocliente: FFAppState().responderComentario,
                                                                                          idModuloSel: _model.idModulo!,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if ((_model.lerSubComentarios ==
                                                                                    getJsonField(
                                                                                      comentariosClientesItem,
                                                                                      r'''$.IDCOMENTARIO''',
                                                                                    )) &&
                                                                                responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final subComentario = getJsonField(
                                                                                      comentariosClientesItem,
                                                                                      r'''$.RESPOSTAS''',
                                                                                    ).toList();
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(subComentario.length, (subComentarioIndex) {
                                                                                        final subComentarioItem = subComentario[subComentarioIndex];
                                                                                        return Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                valueOrDefault<double>(
                                                                                                  () {
                                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                      return 16.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                      return 24.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                      return 24.0;
                                                                                                    } else {
                                                                                                      return 24.0;
                                                                                                    }
                                                                                                  }(),
                                                                                                  0.0,
                                                                                                ),
                                                                                                0.0,
                                                                                                valueOrDefault<double>(
                                                                                                  () {
                                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                      return 16.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                      return 24.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                      return 24.0;
                                                                                                    } else {
                                                                                                      return 24.0;
                                                                                                    }
                                                                                                  }(),
                                                                                                  0.0,
                                                                                                ),
                                                                                                8.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.65,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x1783939B),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.reply,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              functions.convertBase64toUtf8(getJsonField(
                                                                                                                subComentarioItem,
                                                                                                                r'''$.NOME''',
                                                                                                              ).toString()),
                                                                                                              'USUARIOGEP',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                functions.convertBase64toUtf8(getJsonField(
                                                                                                                  subComentarioItem,
                                                                                                                  r'''$.RESPOSTA''',
                                                                                                                ).toString()),
                                                                                                                'MENSAGEM',
                                                                                                              ).maybeHandleOverflow(maxChars: 500),
                                                                                                              maxLines: 2,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Text(
                                                                                                        getJsonField(
                                                                                                          comentariosClientesItem,
                                                                                                          r'''$.DATAHORA''',
                                                                                                        ).toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            if ((_model.lerSubComentarios ==
                                                                                    getJsonField(
                                                                                      comentariosClientesItem,
                                                                                      r'''$.IDCOMENTARIO''',
                                                                                    )) &&
                                                                                responsiveVisibility(
                                                                                  context: context,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final subComentario = getJsonField(
                                                                                      comentariosClientesItem,
                                                                                      r'''$.RESPOSTAS''',
                                                                                    ).toList();
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(subComentario.length, (subComentarioIndex) {
                                                                                        final subComentarioItem = subComentario[subComentarioIndex];
                                                                                        return Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                valueOrDefault<double>(
                                                                                                  () {
                                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                      return 16.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                      return 24.0;
                                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                      return 24.0;
                                                                                                    } else {
                                                                                                      return 24.0;
                                                                                                    }
                                                                                                  }(),
                                                                                                  0.0,
                                                                                                ),
                                                                                                0.0,
                                                                                                16.0,
                                                                                                8.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x3183939B),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.comment_bank_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              functions.convertBase64toUtf8(getJsonField(
                                                                                                                subComentarioItem,
                                                                                                                r'''$.NOME''',
                                                                                                              ).toString()),
                                                                                                              'USUARIOGEP',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          functions.convertBase64toUtf8(getJsonField(
                                                                                                            subComentarioItem,
                                                                                                            r'''$.RESPOSTA''',
                                                                                                          ).toString()),
                                                                                                          'MENSAGEM',
                                                                                                        ).maybeHandleOverflow(maxChars: 500),
                                                                                                        textAlign: TextAlign.justify,
                                                                                                        maxLines: 3,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Text(
                                                                                                        getJsonField(
                                                                                                          comentariosClientesItem,
                                                                                                          r'''$.DATAHORA''',
                                                                                                        ).toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                })
                                                                    .divide(SizedBox(
                                                                        height:
                                                                            16.0))
                                                                    .around(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation1']!),
                                          ),
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
                      if ((_model.closeMenu == false) &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 275.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 275.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 365.0;
                                      } else {
                                        return 365.0;
                                      }
                                    }(),
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  16.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 64.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              AlignedTooltip(
                                                                            content: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Text(
                                                                                  'Recolher menu lateral',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                      ),
                                                                                )),
                                                                            offset:
                                                                                4.0,
                                                                            preferredDirection:
                                                                                AxisDirection.down,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            tailBaseWidth:
                                                                                24.0,
                                                                            tailLength:
                                                                                12.0,
                                                                            waitDuration:
                                                                                Duration(milliseconds: 100),
                                                                            showDuration:
                                                                                Duration(milliseconds: 1500),
                                                                            triggerMode:
                                                                                TooltipTriggerMode.tap,
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.keyboard_double_arrow_right_sharp,
                                                                                color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                setState(() {
                                                                                  _model.closeMenu = true;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              230.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              AutoSizeText(
                                                                            FFAppState().nomeCursoSel,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  lineHeight: 1.1,
                                                                                ),
                                                                            minFontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().darkMode = !FFAppState().darkMode);
                                                                            if (Theme.of(context).brightness ==
                                                                                Brightness.dark) {
                                                                              setDarkModeSetting(context, ThemeMode.light);
                                                                            } else {
                                                                              setDarkModeSetting(context, ThemeMode.dark);
                                                                            }
                                                                          },
                                                                          value:
                                                                              !FFAppState().darkMode,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.dark_mode,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.wb_sunny_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .aulaConcluida !=
                                                                  null)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .progressCourseModel1,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ProgressCourseWidget(
                                                                    totalConcluido:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      TreinamentoGroup
                                                                          .moduloCall
                                                                          .qtdConcluido(
                                                                            coursePageModuloResponse.jsonBody,
                                                                          )
                                                                          ?.first,
                                                                      0,
                                                                    ),
                                                                    totalModulo:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      TreinamentoGroup
                                                                          .moduloCall
                                                                          .qtdModulo(
                                                                            coursePageModuloResponse.jsonBody,
                                                                          )
                                                                          ?.first,
                                                                      0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 10.0,
                                                    thickness: 0.5,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                  ),
                                                  if (coursePageModuloResponse
                                                          .statusCode ==
                                                      200)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final modulosCurso =
                                                                TreinamentoGroup
                                                                        .moduloCall
                                                                        .modulos(
                                                                          coursePageModuloResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList() ??
                                                                    [];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  modulosCurso
                                                                      .length,
                                                                  (modulosCursoIndex) {
                                                                final modulosCursoItem =
                                                                    modulosCurso[
                                                                        modulosCursoIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (_model.modulosSelecionados.contains(getJsonField(
                                                                                    modulosCursoItem,
                                                                                    r'''$.MODULO''',
                                                                                  ).toString())) {
                                                                                    setState(() {
                                                                                      _model.mostrarsubmenu = null;
                                                                                      _model.removeFromModulosSelecionados(getJsonField(
                                                                                        modulosCursoItem,
                                                                                        r'''$.MODULO''',
                                                                                      ).toString());
                                                                                    });
                                                                                  } else {
                                                                                    setState(() {
                                                                                      _model.mostrarsubmenu = getJsonField(
                                                                                        modulosCursoItem,
                                                                                        r'''$.MODULO''',
                                                                                      ).toString();
                                                                                      _model.addToModulosSelecionados(getJsonField(
                                                                                        modulosCursoItem,
                                                                                        r'''$.MODULO''',
                                                                                      ).toString());
                                                                                    });
                                                                                  }
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
                                                                                        color: FFAppState().darkMode ? Color(0x4983939B) : FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                        border: Border.all(
                                                                                          color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).primaryBackground,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.convertBase64toUtf8(getJsonField(
                                                                                                      modulosCursoItem,
                                                                                                      r'''$.MODULO''',
                                                                                                    ).toString()),
                                                                                                    'modulo',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                if (_model.modulosSelecionados.contains(getJsonField(
                                                                                                  modulosCursoItem,
                                                                                                  r'''$.MODULO''',
                                                                                                ).toString())) {
                                                                                                  setState(() {
                                                                                                    _model.removeFromModulosSelecionados(getJsonField(
                                                                                                      modulosCursoItem,
                                                                                                      r'''$.MODULO''',
                                                                                                    ).toString());
                                                                                                  });
                                                                                                } else {
                                                                                                  setState(() {
                                                                                                    _model.addToModulosSelecionados(getJsonField(
                                                                                                      modulosCursoItem,
                                                                                                      r'''$.MODULO''',
                                                                                                    ).toString());
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    setState(
                                                                                                      () => _model.modulosSelecionados.contains(getJsonField(
                                                                                                        modulosCursoItem,
                                                                                                        r'''$.MODULO''',
                                                                                                      ).toString())
                                                                                                          ? _model.removeFromModulosSelecionados(getJsonField(
                                                                                                              modulosCursoItem,
                                                                                                              r'''$.MODULO''',
                                                                                                            ).toString())
                                                                                                          : _model.addToModulosSelecionados(getJsonField(
                                                                                                              modulosCursoItem,
                                                                                                              r'''$.MODULO''',
                                                                                                            ).toString()),
                                                                                                    );
                                                                                                    if (_model.mostrarsubmenu != null && _model.mostrarsubmenu != '') {
                                                                                                      setState(() {
                                                                                                        _model.mostrarsubmenu = null;
                                                                                                        _model.removeFromModulosSelecionados(getJsonField(
                                                                                                          modulosCursoItem,
                                                                                                          r'''$.MODULO''',
                                                                                                        ).toString());
                                                                                                      });
                                                                                                    } else {
                                                                                                      setState(() {
                                                                                                        _model.mostrarsubmenu = getJsonField(
                                                                                                          modulosCursoItem,
                                                                                                          r'''$.MODULO''',
                                                                                                        ).toString();
                                                                                                        _model.addToModulosSelecionados(getJsonField(
                                                                                                          modulosCursoItem,
                                                                                                          r'''$.MODULO''',
                                                                                                        ).toString());
                                                                                                      });
                                                                                                    }
                                                                                                  },
                                                                                                  value: _model.modulosSelecionados.contains(getJsonField(
                                                                                                    modulosCursoItem,
                                                                                                    r'''$.MODULO''',
                                                                                                  ).toString()),
                                                                                                  onIcon: Icon(
                                                                                                    Icons.keyboard_arrow_up_sharp,
                                                                                                    color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primary,
                                                                                                    size: 25.0,
                                                                                                  ),
                                                                                                  offIcon: Icon(
                                                                                                    Icons.keyboard_arrow_down,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 25.0,
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
                                                                          ),
                                                                          if (_model
                                                                              .modulosSelecionados
                                                                              .contains(getJsonField(
                                                                            modulosCursoItem,
                                                                            r'''$.MODULO''',
                                                                          ).toString()))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final subModulos = getJsonField(
                                                                                    modulosCursoItem,
                                                                                    r'''$.SUBMENU''',
                                                                                  ).toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: List.generate(subModulos.length, (subModulosIndex) {
                                                                                      final subModulosItem = subModulos[subModulosIndex];
                                                                                      return Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              var _shouldSetState = false;
                                                                                              // Este fluxo verifica o link do vídeo, e retorna o link do vídeo para a variável urlAula, atualizando o player.
                                                                                              if (_model.urlAula ==
                                                                                                  getJsonField(
                                                                                                    subModulosItem,
                                                                                                    r'''$.LINKVIDEO''',
                                                                                                  )) {
                                                                                                if (_shouldSetState) setState(() {});
                                                                                                return;
                                                                                              }

                                                                                              // reset variáveis
                                                                                              setState(() {
                                                                                                _model.urlAula = null;
                                                                                              });
                                                                                              setState(() {
                                                                                                FFAppState().linkExeternoAula = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.LINKAUXILIAR''',
                                                                                                ).toString();
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.nomeSubModulo = null;
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.aulaConcluida = null;
                                                                                              });
                                                                                              await Future.delayed(const Duration(milliseconds: 50));
                                                                                              setState(() {
                                                                                                _model.idModulo = null;
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.urlAula = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.LINKVIDEO''',
                                                                                                ).toString();
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.idModulo = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.IDMODULO''',
                                                                                                );
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.aulaConcluida = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.CONCLUIDO''',
                                                                                                );
                                                                                              });
                                                                                              setState(() {
                                                                                                _model.nomeSubModulo = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.SUBMODULO''',
                                                                                                ).toString();
                                                                                              });
                                                                                              _model.resStatusNotaSubModulo = await TreinamentoGroup.statusCall.call(
                                                                                                idmodulo: _model.idModulo,
                                                                                                cpf: FFAppState().cpfUsuario,
                                                                                                nomeusuario: FFAppState().nomeUsuario,
                                                                                                database: FFAppState().bancoUsuario,
                                                                                              );
                                                                                              _shouldSetState = true;
                                                                                              if ((_model.resStatusNotaSubModulo?.succeeded ?? true)) {
                                                                                                setState(() {
                                                                                                  FFAppState().deleteNotaAula();
                                                                                                  FFAppState().notaAula = 0;
                                                                                                });
                                                                                                setState(() {
                                                                                                  FFAppState().notaAula = TreinamentoGroup.statusCall.avaliacao(
                                                                                                    (_model.resStatusNotaSubModulo?.jsonBody ?? ''),
                                                                                                  )!;
                                                                                                });
                                                                                              }
                                                                                              if (_model.aulaselecionada ==
                                                                                                  getJsonField(
                                                                                                    subModulosItem,
                                                                                                    r'''$.SUBMODULO''',
                                                                                                  )) {
                                                                                                if (_shouldSetState) setState(() {});
                                                                                                return;
                                                                                              }

                                                                                              setState(() {
                                                                                                _model.aulaselecionada = getJsonField(
                                                                                                  subModulosItem,
                                                                                                  r'''$.SUBMODULO''',
                                                                                                ).toString();
                                                                                              });
                                                                                              if (_shouldSetState) setState(() {});
                                                                                            },
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 0.5,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8.0),
                                                                                                  bottomRight: Radius.circular(8.0),
                                                                                                  topLeft: Radius.circular(8.0),
                                                                                                  topRight: Radius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                              child: AnimatedContainer(
                                                                                                duration: Duration(milliseconds: 100),
                                                                                                curve: Curves.bounceOut,
                                                                                                width: double.infinity,
                                                                                                height: 52.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: () {
                                                                                                    if (_model.aulaselecionada ==
                                                                                                        getJsonField(
                                                                                                          subModulosItem,
                                                                                                          r'''$.SUBMODULO''',
                                                                                                        )) {
                                                                                                      return FlutterFlowTheme.of(context).primary;
                                                                                                    } else if (Theme.of(context).brightness == Brightness.dark) {
                                                                                                      return Color(0x5E262D34);
                                                                                                    } else {
                                                                                                      return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                                    }
                                                                                                  }(),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(8.0),
                                                                                                    bottomRight: Radius.circular(8.0),
                                                                                                    topLeft: Radius.circular(8.0),
                                                                                                    topRight: Radius.circular(8.0),
                                                                                                  ),
                                                                                                  shape: BoxShape.rectangle,
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Icon(
                                                                                                                  Icons.play_circle,
                                                                                                                  color: _model.aulaselecionada ==
                                                                                                                          getJsonField(
                                                                                                                            subModulosItem,
                                                                                                                            r'''$.SUBMODULO''',
                                                                                                                          )
                                                                                                                      ? FlutterFlowTheme.of(context).info
                                                                                                                      : FlutterFlowTheme.of(context).primaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: () {
                                                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                                        return 80.0;
                                                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                                        return 100.0;
                                                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                                        return 185.0;
                                                                                                                      } else {
                                                                                                                        return 185.0;
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          functions.convertBase64toUtf8(getJsonField(
                                                                                                                            subModulosItem,
                                                                                                                            r'''$.SUBMODULO''',
                                                                                                                          ).toString()),
                                                                                                                          'submodulo',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 150,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        textAlign: TextAlign.start,
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              color: _model.aulaselecionada ==
                                                                                                                                      getJsonField(
                                                                                                                                        subModulosItem,
                                                                                                                                        r'''$.SUBMODULO''',
                                                                                                                                      )
                                                                                                                                  ? FlutterFlowTheme.of(context).info
                                                                                                                                  : FlutterFlowTheme.of(context).primaryText,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: 36.0,
                                                                                                                height: 36.0,
                                                                                                                decoration: BoxDecoration(),
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    functions.convertBase64toUtf8(getJsonField(
                                                                                                                      subModulosItem,
                                                                                                                      r'''$.TEMPO''',
                                                                                                                    ).toString()),
                                                                                                                    'tempoAula',
                                                                                                                  ),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: _model.aulaselecionada ==
                                                                                                                                getJsonField(
                                                                                                                                  subModulosItem,
                                                                                                                                  r'''$.SUBMODULO''',
                                                                                                                                )
                                                                                                                            ? Color(0xA2FFFFFF)
                                                                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (getJsonField(
                                                                                                              subModulosItem,
                                                                                                              r'''$.CONCLUIDO''',
                                                                                                            ))
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Icon(
                                                                                                                  Icons.check_circle_outline_sharp,
                                                                                                                  color: () {
                                                                                                                    if (_model.aulaselecionada ==
                                                                                                                        getJsonField(
                                                                                                                          subModulosItem,
                                                                                                                          r'''$.SUBMODULO''',
                                                                                                                        )) {
                                                                                                                      return FlutterFlowTheme.of(context).info;
                                                                                                                    } else if (Theme.of(context).brightness == Brightness.dark) {
                                                                                                                      return Colors.white;
                                                                                                                    } else {
                                                                                                                      return FlutterFlowTheme.of(context).success;
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  size: 28.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (!getJsonField(
                                                                                                              subModulosItem,
                                                                                                              r'''$.CONCLUIDO''',
                                                                                                            ))
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Icon(
                                                                                                                  Icons.radio_button_off,
                                                                                                                  color: () {
                                                                                                                    if (_model.aulaselecionada ==
                                                                                                                        getJsonField(
                                                                                                                          subModulosItem,
                                                                                                                          r'''$.SUBMODULO''',
                                                                                                                        )) {
                                                                                                                      return FlutterFlowTheme.of(context).info;
                                                                                                                    } else if (Theme.of(context).brightness == Brightness.dark) {
                                                                                                                      return Colors.white;
                                                                                                                    } else {
                                                                                                                      return FlutterFlowTheme.of(context).accent3;
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  size: 28.0,
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
                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 15.0,
                                              thickness: 0.5,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 64.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .btnCertificadoModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BtnCertificadoWidget(
                                                    totalConcluido:
                                                        valueOrDefault<int>(
                                                      TreinamentoGroup
                                                          .moduloCall
                                                          .qtdConcluido(
                                                            coursePageModuloResponse
                                                                .jsonBody,
                                                          )
                                                          ?.first,
                                                      0,
                                                    ),
                                                    totalModulo:
                                                        valueOrDefault<int>(
                                                      TreinamentoGroup
                                                          .moduloCall
                                                          .qtdModulo(
                                                            coursePageModuloResponse
                                                                .jsonBody,
                                                          )
                                                          ?.first,
                                                      0,
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
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                        ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
