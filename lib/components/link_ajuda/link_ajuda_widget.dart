import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'link_ajuda_model.dart';
export 'link_ajuda_model.dart';

class LinkAjudaWidget extends StatefulWidget {
  const LinkAjudaWidget({super.key});

  @override
  State<LinkAjudaWidget> createState() => _LinkAjudaWidgetState();
}

class _LinkAjudaWidgetState extends State<LinkAjudaWidget> {
  late LinkAjudaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkAjudaModel());

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

    return Visibility(
      visible: FFAppState().linkExeternoAula != null &&
          FFAppState().linkExeternoAula != '',
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await launchURL(FFAppState().linkExeternoAula);
            },
            child: Icon(
              Icons.help_center,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
