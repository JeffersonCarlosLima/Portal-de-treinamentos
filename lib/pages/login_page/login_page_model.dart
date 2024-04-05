import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int? skey;

  List<String> bancosCliente = [];
  void addToBancosCliente(String item) => bancosCliente.add(item);
  void removeFromBancosCliente(String item) => bancosCliente.remove(item);
  void removeAtIndexFromBancosCliente(int index) =>
      bancosCliente.removeAt(index);
  void insertAtIndexInBancosCliente(int index, String item) =>
      bancosCliente.insert(index, item);
  void updateBancosClienteAtIndex(int index, Function(String) updateFn) =>
      bancosCliente[index] = updateFn(bancosCliente[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for cpfLogin widget.
  FocusNode? cpfLoginFocusNode;
  TextEditingController? cpfLoginController;
  final cpfLoginMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfLoginControllerValidator;
  // Stores action output result for [Custom Action - validaCPF] action in cpfLogin widget.
  bool? cpfValidado;
  // Stores action output result for [Backend Call - API (ListaBanco)] action in cpfLogin widget.
  ApiCallResponse? listaBanco;
  // State field(s) for senhaLogin widget.
  FocusNode? senhaLoginFocusNode;
  TextEditingController? senhaLoginController;
  late bool senhaLoginVisibility;
  String? Function(BuildContext, String?)? senhaLoginControllerValidator;
  // Stores action output result for [Custom Action - convertUppercase] action in btnEntrar widget.
  String? senhaUppercase;
  // Stores action output result for [Custom Action - coverterMD5] action in btnEntrar widget.
  String? senhaCriptografada;
  // Stores action output result for [Backend Call - API (ValidarSenha)] action in btnEntrar widget.
  ApiCallResponse? apiResultyog;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    senhaLoginVisibility = false;
  }

  @override
  void dispose() {
    cpfLoginFocusNode?.dispose();
    cpfLoginController?.dispose();

    senhaLoginFocusNode?.dispose();
    senhaLoginController?.dispose();
  }
}
