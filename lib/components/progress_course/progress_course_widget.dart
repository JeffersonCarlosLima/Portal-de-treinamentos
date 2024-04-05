import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_course_model.dart';
export 'progress_course_model.dart';

class ProgressCourseWidget extends StatefulWidget {
  const ProgressCourseWidget({
    super.key,
    int? totalConcluido,
    int? totalModulo,
  })  : this.totalConcluido = totalConcluido ?? 0,
        this.totalModulo = totalModulo ?? 0;

  final int totalConcluido;
  final int totalModulo;

  @override
  State<ProgressCourseWidget> createState() => _ProgressCourseWidgetState();
}

class _ProgressCourseWidgetState extends State<ProgressCourseWidget> {
  late ProgressCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressCourseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: CircularPercentIndicator(
                  percent: functions.convertPorcentagemFrac(
                      widget.totalConcluido, widget.totalModulo)!,
                  radius: 26.5,
                  lineWidth: 4.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).success,
                  backgroundColor: Color(0xFFCDCDD0),
                  center: Text(
                    '${functions.calculaPorcentagem(widget.totalConcluido, widget.totalModulo).toString()}%',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                  startAngle: 0.0,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Text(
                '${widget.totalConcluido.toString()} de ${widget.totalModulo.toString()} Aulas concluídas',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
