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
import 'course_page_widget.dart' show CoursePageWidget;
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

class CoursePageModel extends FlutterFlowModel<CoursePageWidget> {
  ///  Local state fields for this page.

  bool? statusCurso;

  String? mostrarsubmenu;

  bool? aulaConcluida;

  String? aulaselecionada;

  String? urlAula;

  String? nomeSubModulo;

  List<String> listSubModulos = [];
  void addToListSubModulos(String item) => listSubModulos.add(item);
  void removeFromListSubModulos(String item) => listSubModulos.remove(item);
  void removeAtIndexFromListSubModulos(int index) =>
      listSubModulos.removeAt(index);
  void insertAtIndexInListSubModulos(int index, String item) =>
      listSubModulos.insert(index, item);
  void updateListSubModulosAtIndex(int index, Function(String) updateFn) =>
      listSubModulos[index] = updateFn(listSubModulos[index]);

  String? indexSubmodulo;

  String? indexUrlVideo;

  bool tema = true;

  List<String> modulosSelecionados = [];
  void addToModulosSelecionados(String item) => modulosSelecionados.add(item);
  void removeFromModulosSelecionados(String item) =>
      modulosSelecionados.remove(item);
  void removeAtIndexFromModulosSelecionados(int index) =>
      modulosSelecionados.removeAt(index);
  void insertAtIndexInModulosSelecionados(int index, String item) =>
      modulosSelecionados.insert(index, item);
  void updateModulosSelecionadosAtIndex(int index, Function(String) updateFn) =>
      modulosSelecionados[index] = updateFn(modulosSelecionados[index]);

  bool closeMenu = false;

  int? idModulo;

  int? indexIDmodulo;

  List<int> listNota = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  void addToListNota(int item) => listNota.add(item);
  void removeFromListNota(int item) => listNota.remove(item);
  void removeAtIndexFromListNota(int index) => listNota.removeAt(index);
  void insertAtIndexInListNota(int index, int item) =>
      listNota.insert(index, item);
  void updateListNotaAtIndex(int index, Function(int) updateFn) =>
      listNota[index] = updateFn(listNota[index]);

  String? comentariob64;

  int? lerSubComentarios = 0;

  List<dynamic> subModuloJSON = [];
  void addToSubModuloJSON(dynamic item) => subModuloJSON.add(item);
  void removeFromSubModuloJSON(dynamic item) => subModuloJSON.remove(item);
  void removeAtIndexFromSubModuloJSON(int index) =>
      subModuloJSON.removeAt(index);
  void insertAtIndexInSubModuloJSON(int index, dynamic item) =>
      subModuloJSON.insert(index, item);
  void updateSubModuloJSONAtIndex(int index, Function(dynamic) updateFn) =>
      subModuloJSON[index] = updateFn(subModuloJSON[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for MostrarMenu widget.
  bool mostrarMenuHovered = false;
  // State field(s) for btback widget.
  bool btbackHovered = false;
  // Stores action output result for [Backend Call - API (STATUS)] action in btnBack widget.
  ApiCallResponse? resStatusUP;
  // Stores action output result for [Backend Call - API (POSTStatusModulo)] action in btnConcluir widget.
  ApiCallResponse? btnConcluir;
  // Stores action output result for [Backend Call - API (POSTStatusModulo)] action in btnConcluir widget.
  ApiCallResponse? desConcluir;
  // State field(s) for btNext widget.
  bool btNextHovered = false;
  // Stores action output result for [Backend Call - API (STATUS)] action in btnProximo widget.
  ApiCallResponse? resStatusDown;
  // Model for linkAjuda component.
  late LinkAjudaModel linkAjudaModel;
  // Models for numeroNota dynamic component.
  late FlutterFlowDynamicModels<NumeroNotaModel> numeroNotaModels;
  // Stores action output result for [Backend Call - API (POSTStatusModulo)] action in numeroNota widget.
  ApiCallResponse? postNota;
  // Stores action output result for [Backend Call - API (STATUS)] action in numeroNota widget.
  ApiCallResponse? resStatusNotaClik;
  // State field(s) for COMENTARIO widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioController;
  String? Function(BuildContext, String?)? comentarioControllerValidator;
  // Stores action output result for [Custom Action - verificaComentario] action in btnConcluir widget.
  bool? verificaComentario;
  // Stores action output result for [Backend Call - API (POSTComentario)] action in btnConcluir widget.
  ApiCallResponse? comentarioPost;
  // Models for campocomentar dynamic component.
  late FlutterFlowDynamicModels<CampocomentarModel> campocomentarModels;
  // Model for progressCourse component.
  late ProgressCourseModel progressCourseModel1;
  // Stores action output result for [Backend Call - API (STATUS)] action in contentView_1 widget.
  ApiCallResponse? resStatusNotaSubModulo;
  // Model for btnCertificado component.
  late BtnCertificadoModel btnCertificadoModel1;
  // Model for progressCourse component.
  late ProgressCourseModel progressCourseModel2;
  // Stores action output result for [Backend Call - API (STATUS)] action in contentView_1 widget.
  ApiCallResponse? resStatusNotaSubModuloM;
  // Model for btnCertificado component.
  late BtnCertificadoModel btnCertificadoModel2;

  @override
  void initState(BuildContext context) {
    linkAjudaModel = createModel(context, () => LinkAjudaModel());
    numeroNotaModels = FlutterFlowDynamicModels(() => NumeroNotaModel());
    campocomentarModels = FlutterFlowDynamicModels(() => CampocomentarModel());
    progressCourseModel1 = createModel(context, () => ProgressCourseModel());
    btnCertificadoModel1 = createModel(context, () => BtnCertificadoModel());
    progressCourseModel2 = createModel(context, () => ProgressCourseModel());
    btnCertificadoModel2 = createModel(context, () => BtnCertificadoModel());
  }

  @override
  void dispose() {
    linkAjudaModel.dispose();
    numeroNotaModels.dispose();
    comentarioFocusNode?.dispose();
    comentarioController?.dispose();

    campocomentarModels.dispose();
    progressCourseModel1.dispose();
    btnCertificadoModel1.dispose();
    progressCourseModel2.dispose();
    btnCertificadoModel2.dispose();
  }
}
