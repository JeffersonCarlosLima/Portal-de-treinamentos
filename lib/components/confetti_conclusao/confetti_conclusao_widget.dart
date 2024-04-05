import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confetti_conclusao_model.dart';
export 'confetti_conclusao_model.dart';

class ConfettiConclusaoWidget extends StatefulWidget {
  const ConfettiConclusaoWidget({super.key});

  @override
  State<ConfettiConclusaoWidget> createState() =>
      _ConfettiConclusaoWidgetState();
}

class _ConfettiConclusaoWidgetState extends State<ConfettiConclusaoWidget> {
  late ConfettiConclusaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfettiConclusaoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      Navigator.pop(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: 500.0,
          height: 500.0,
          child: RiveAnimation.asset(
            'assets/rive_animations/effect_confetti_explosio.riv',
            artboard: 'Main',
            fit: BoxFit.fill,
            controllers: _model.riveAnimationControllers,
          ),
        ),
      ),
    );
  }
}
