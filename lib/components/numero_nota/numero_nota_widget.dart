import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'numero_nota_model.dart';
export 'numero_nota_model.dart';

class NumeroNotaWidget extends StatefulWidget {
  const NumeroNotaWidget({
    super.key,
    required this.notalist,
    required this.notares,
  });

  final int? notalist;
  final int? notares;

  @override
  State<NumeroNotaWidget> createState() => _NumeroNotaWidgetState();
}

class _NumeroNotaWidgetState extends State<NumeroNotaWidget> {
  late NumeroNotaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumeroNotaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 38.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 40.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 40.0;
                    } else {
                      return 40.0;
                    }
                  }(),
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: () {
                      if (_model.numHovered1 == true) {
                        return FlutterFlowTheme.of(context).primary;
                      } else if (widget.notalist == widget.notares) {
                        return FlutterFlowTheme.of(context).primary;
                      } else {
                        return FlutterFlowTheme.of(context).info;
                      }
                    }(),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x1E000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      widget.notalist!.toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: () {
                              if (_model.numHovered1 == true) {
                                return FlutterFlowTheme.of(context).info;
                              } else if (widget.notalist == widget.notares) {
                                return FlutterFlowTheme.of(context).info;
                              } else {
                                return Color(0xFF14181B);
                              }
                            }(),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
            onEnter: ((event) async {
              setState(() => _model.numHovered1 = true);
            }),
            onExit: ((event) async {
              setState(() => _model.numHovered1 = false);
            }),
          ),
        if (responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ))
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 2.0, 8.0),
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: () {
                      if (_model.numHovered2 == true) {
                        return FlutterFlowTheme.of(context).primary;
                      } else if (widget.notalist == widget.notares) {
                        return FlutterFlowTheme.of(context).primary;
                      } else {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      }
                    }(),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      widget.notalist!.toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: () {
                              if (_model.numHovered2 == true) {
                                return Colors.white;
                              } else if (widget.notalist == widget.notares) {
                                return Colors.white;
                              } else {
                                return FlutterFlowTheme.of(context).primaryText;
                              }
                            }(),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
            onEnter: ((event) async {
              setState(() => _model.numHovered2 = true);
            }),
            onExit: ((event) async {
              setState(() => _model.numHovered2 = false);
            }),
          ),
      ],
    );
  }
}
