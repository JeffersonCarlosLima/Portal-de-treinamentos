import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _nomeUsuario =
          await secureStorage.getString('ff_nomeUsuario') ?? _nomeUsuario;
    });
    await _safeInitAsync(() async {
      _cpfUsuario =
          await secureStorage.getString('ff_cpfUsuario') ?? _cpfUsuario;
    });
    await _safeInitAsync(() async {
      _bancoUsuario =
          await secureStorage.getString('ff_bancoUsuario') ?? _bancoUsuario;
    });
    await _safeInitAsync(() async {
      _ListBancos =
          await secureStorage.getStringList('ff_ListBancos') ?? _ListBancos;
    });
    await _safeInitAsync(() async {
      _nomeCursoSel =
          await secureStorage.getString('ff_nomeCursoSel') ?? _nomeCursoSel;
    });
    await _safeInitAsync(() async {
      _totConcluido =
          await secureStorage.getInt('ff_totConcluido') ?? _totConcluido;
    });
    await _safeInitAsync(() async {
      _totModulo = await secureStorage.getInt('ff_totModulo') ?? _totModulo;
    });
    await _safeInitAsync(() async {
      _submodulo1 =
          await secureStorage.getString('ff_submodulo1') ?? _submodulo1;
    });
    await _safeInitAsync(() async {
      _videosel1 = await secureStorage.getString('ff_videosel1') ?? _videosel1;
    });
    await _safeInitAsync(() async {
      _listaSubmodulos =
          await secureStorage.getStringList('ff_listaSubmodulos') ??
              _listaSubmodulos;
    });
    await _safeInitAsync(() async {
      _listaModulos =
          await secureStorage.getStringList('ff_listaModulos') ?? _listaModulos;
    });
    await _safeInitAsync(() async {
      _listIdSubModulo =
          (await secureStorage.getStringList('ff_listIdSubModulo'))
                  ?.map(int.parse)
                  .toList() ??
              _listIdSubModulo;
    });
    await _safeInitAsync(() async {
      _statusSubModulo1 = await secureStorage.getBool('ff_statusSubModulo1') ??
          _statusSubModulo1;
    });
    await _safeInitAsync(() async {
      _IDModuloSel =
          await secureStorage.getInt('ff_IDModuloSel') ?? _IDModuloSel;
    });
    await _safeInitAsync(() async {
      _nomeUsuarioB64 =
          await secureStorage.getString('ff_nomeUsuarioB64') ?? _nomeUsuarioB64;
    });
    await _safeInitAsync(() async {
      _statusAulaSel =
          await secureStorage.getBool('ff_statusAulaSel') ?? _statusAulaSel;
    });
    await _safeInitAsync(() async {
      _idSubModulo1 =
          await secureStorage.getInt('ff_idSubModulo1') ?? _idSubModulo1;
    });
    await _safeInitAsync(() async {
      _notaAula = await secureStorage.getInt('ff_notaAula') ?? _notaAula;
    });
    await _safeInitAsync(() async {
      _responderComentario =
          await secureStorage.getInt('ff_responderComentario') ??
              _responderComentario;
    });
    await _safeInitAsync(() async {
      _darkMode = await secureStorage.getBool('ff_darkMode') ?? _darkMode;
    });
    await _safeInitAsync(() async {
      _linkExeternoAula =
          await secureStorage.getString('ff_linkExeternoAula') ??
              _linkExeternoAula;
    });
    await _safeInitAsync(() async {
      _IDcurso = await secureStorage.getInt('ff_IDcurso') ?? _IDcurso;
    });
    await _safeInitAsync(() async {
      _aulaConcluida =
          await secureStorage.getBool('ff_aulaConcluida') ?? _aulaConcluida;
    });
    await _safeInitAsync(() async {
      _listaSubModulo =
          (await secureStorage.getStringList('ff_listaSubModulo'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _listaSubModulo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _nomeUsuario = '';
  String get nomeUsuario => _nomeUsuario;
  set nomeUsuario(String _value) {
    _nomeUsuario = _value;
    secureStorage.setString('ff_nomeUsuario', _value);
  }

  void deleteNomeUsuario() {
    secureStorage.delete(key: 'ff_nomeUsuario');
  }

  String _cpfUsuario = '';
  String get cpfUsuario => _cpfUsuario;
  set cpfUsuario(String _value) {
    _cpfUsuario = _value;
    secureStorage.setString('ff_cpfUsuario', _value);
  }

  void deleteCpfUsuario() {
    secureStorage.delete(key: 'ff_cpfUsuario');
  }

  String _bancoUsuario = '';
  String get bancoUsuario => _bancoUsuario;
  set bancoUsuario(String _value) {
    _bancoUsuario = _value;
    secureStorage.setString('ff_bancoUsuario', _value);
  }

  void deleteBancoUsuario() {
    secureStorage.delete(key: 'ff_bancoUsuario');
  }

  List<String> _ListBancos = [];
  List<String> get ListBancos => _ListBancos;
  set ListBancos(List<String> _value) {
    _ListBancos = _value;
    secureStorage.setStringList('ff_ListBancos', _value);
  }

  void deleteListBancos() {
    secureStorage.delete(key: 'ff_ListBancos');
  }

  void addToListBancos(String _value) {
    _ListBancos.add(_value);
    secureStorage.setStringList('ff_ListBancos', _ListBancos);
  }

  void removeFromListBancos(String _value) {
    _ListBancos.remove(_value);
    secureStorage.setStringList('ff_ListBancos', _ListBancos);
  }

  void removeAtIndexFromListBancos(int _index) {
    _ListBancos.removeAt(_index);
    secureStorage.setStringList('ff_ListBancos', _ListBancos);
  }

  void updateListBancosAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _ListBancos[_index] = updateFn(_ListBancos[_index]);
    secureStorage.setStringList('ff_ListBancos', _ListBancos);
  }

  void insertAtIndexInListBancos(int _index, String _value) {
    _ListBancos.insert(_index, _value);
    secureStorage.setStringList('ff_ListBancos', _ListBancos);
  }

  String _nomeCursoSel = '';
  String get nomeCursoSel => _nomeCursoSel;
  set nomeCursoSel(String _value) {
    _nomeCursoSel = _value;
    secureStorage.setString('ff_nomeCursoSel', _value);
  }

  void deleteNomeCursoSel() {
    secureStorage.delete(key: 'ff_nomeCursoSel');
  }

  int _totConcluido = 0;
  int get totConcluido => _totConcluido;
  set totConcluido(int _value) {
    _totConcluido = _value;
    secureStorage.setInt('ff_totConcluido', _value);
  }

  void deleteTotConcluido() {
    secureStorage.delete(key: 'ff_totConcluido');
  }

  int _totModulo = 0;
  int get totModulo => _totModulo;
  set totModulo(int _value) {
    _totModulo = _value;
    secureStorage.setInt('ff_totModulo', _value);
  }

  void deleteTotModulo() {
    secureStorage.delete(key: 'ff_totModulo');
  }

  String _submodulo1 = '';
  String get submodulo1 => _submodulo1;
  set submodulo1(String _value) {
    _submodulo1 = _value;
    secureStorage.setString('ff_submodulo1', _value);
  }

  void deleteSubmodulo1() {
    secureStorage.delete(key: 'ff_submodulo1');
  }

  String _videosel1 = '';
  String get videosel1 => _videosel1;
  set videosel1(String _value) {
    _videosel1 = _value;
    secureStorage.setString('ff_videosel1', _value);
  }

  void deleteVideosel1() {
    secureStorage.delete(key: 'ff_videosel1');
  }

  List<String> _listaSubmodulos = [];
  List<String> get listaSubmodulos => _listaSubmodulos;
  set listaSubmodulos(List<String> _value) {
    _listaSubmodulos = _value;
    secureStorage.setStringList('ff_listaSubmodulos', _value);
  }

  void deleteListaSubmodulos() {
    secureStorage.delete(key: 'ff_listaSubmodulos');
  }

  void addToListaSubmodulos(String _value) {
    _listaSubmodulos.add(_value);
    secureStorage.setStringList('ff_listaSubmodulos', _listaSubmodulos);
  }

  void removeFromListaSubmodulos(String _value) {
    _listaSubmodulos.remove(_value);
    secureStorage.setStringList('ff_listaSubmodulos', _listaSubmodulos);
  }

  void removeAtIndexFromListaSubmodulos(int _index) {
    _listaSubmodulos.removeAt(_index);
    secureStorage.setStringList('ff_listaSubmodulos', _listaSubmodulos);
  }

  void updateListaSubmodulosAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listaSubmodulos[_index] = updateFn(_listaSubmodulos[_index]);
    secureStorage.setStringList('ff_listaSubmodulos', _listaSubmodulos);
  }

  void insertAtIndexInListaSubmodulos(int _index, String _value) {
    _listaSubmodulos.insert(_index, _value);
    secureStorage.setStringList('ff_listaSubmodulos', _listaSubmodulos);
  }

  List<String> _listaUrlVideo = [];
  List<String> get listaUrlVideo => _listaUrlVideo;
  set listaUrlVideo(List<String> _value) {
    _listaUrlVideo = _value;
  }

  void addToListaUrlVideo(String _value) {
    _listaUrlVideo.add(_value);
  }

  void removeFromListaUrlVideo(String _value) {
    _listaUrlVideo.remove(_value);
  }

  void removeAtIndexFromListaUrlVideo(int _index) {
    _listaUrlVideo.removeAt(_index);
  }

  void updateListaUrlVideoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listaUrlVideo[_index] = updateFn(_listaUrlVideo[_index]);
  }

  void insertAtIndexInListaUrlVideo(int _index, String _value) {
    _listaUrlVideo.insert(_index, _value);
  }

  List<String> _listaModulos = [];
  List<String> get listaModulos => _listaModulos;
  set listaModulos(List<String> _value) {
    _listaModulos = _value;
    secureStorage.setStringList('ff_listaModulos', _value);
  }

  void deleteListaModulos() {
    secureStorage.delete(key: 'ff_listaModulos');
  }

  void addToListaModulos(String _value) {
    _listaModulos.add(_value);
    secureStorage.setStringList('ff_listaModulos', _listaModulos);
  }

  void removeFromListaModulos(String _value) {
    _listaModulos.remove(_value);
    secureStorage.setStringList('ff_listaModulos', _listaModulos);
  }

  void removeAtIndexFromListaModulos(int _index) {
    _listaModulos.removeAt(_index);
    secureStorage.setStringList('ff_listaModulos', _listaModulos);
  }

  void updateListaModulosAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listaModulos[_index] = updateFn(_listaModulos[_index]);
    secureStorage.setStringList('ff_listaModulos', _listaModulos);
  }

  void insertAtIndexInListaModulos(int _index, String _value) {
    _listaModulos.insert(_index, _value);
    secureStorage.setStringList('ff_listaModulos', _listaModulos);
  }

  List<int> _listIdSubModulo = [];
  List<int> get listIdSubModulo => _listIdSubModulo;
  set listIdSubModulo(List<int> _value) {
    _listIdSubModulo = _value;
    secureStorage.setStringList(
        'ff_listIdSubModulo', _value.map((x) => x.toString()).toList());
  }

  void deleteListIdSubModulo() {
    secureStorage.delete(key: 'ff_listIdSubModulo');
  }

  void addToListIdSubModulo(int _value) {
    _listIdSubModulo.add(_value);
    secureStorage.setStringList('ff_listIdSubModulo',
        _listIdSubModulo.map((x) => x.toString()).toList());
  }

  void removeFromListIdSubModulo(int _value) {
    _listIdSubModulo.remove(_value);
    secureStorage.setStringList('ff_listIdSubModulo',
        _listIdSubModulo.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListIdSubModulo(int _index) {
    _listIdSubModulo.removeAt(_index);
    secureStorage.setStringList('ff_listIdSubModulo',
        _listIdSubModulo.map((x) => x.toString()).toList());
  }

  void updateListIdSubModuloAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _listIdSubModulo[_index] = updateFn(_listIdSubModulo[_index]);
    secureStorage.setStringList('ff_listIdSubModulo',
        _listIdSubModulo.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListIdSubModulo(int _index, int _value) {
    _listIdSubModulo.insert(_index, _value);
    secureStorage.setStringList('ff_listIdSubModulo',
        _listIdSubModulo.map((x) => x.toString()).toList());
  }

  bool _statusSubModulo1 = false;
  bool get statusSubModulo1 => _statusSubModulo1;
  set statusSubModulo1(bool _value) {
    _statusSubModulo1 = _value;
    secureStorage.setBool('ff_statusSubModulo1', _value);
  }

  void deleteStatusSubModulo1() {
    secureStorage.delete(key: 'ff_statusSubModulo1');
  }

  int _IDModuloSel = 0;
  int get IDModuloSel => _IDModuloSel;
  set IDModuloSel(int _value) {
    _IDModuloSel = _value;
    secureStorage.setInt('ff_IDModuloSel', _value);
  }

  void deleteIDModuloSel() {
    secureStorage.delete(key: 'ff_IDModuloSel');
  }

  String _nomeUsuarioB64 = '';
  String get nomeUsuarioB64 => _nomeUsuarioB64;
  set nomeUsuarioB64(String _value) {
    _nomeUsuarioB64 = _value;
    secureStorage.setString('ff_nomeUsuarioB64', _value);
  }

  void deleteNomeUsuarioB64() {
    secureStorage.delete(key: 'ff_nomeUsuarioB64');
  }

  bool _statusAulaSel = false;
  bool get statusAulaSel => _statusAulaSel;
  set statusAulaSel(bool _value) {
    _statusAulaSel = _value;
    secureStorage.setBool('ff_statusAulaSel', _value);
  }

  void deleteStatusAulaSel() {
    secureStorage.delete(key: 'ff_statusAulaSel');
  }

  int _idSubModulo1 = 0;
  int get idSubModulo1 => _idSubModulo1;
  set idSubModulo1(int _value) {
    _idSubModulo1 = _value;
    secureStorage.setInt('ff_idSubModulo1', _value);
  }

  void deleteIdSubModulo1() {
    secureStorage.delete(key: 'ff_idSubModulo1');
  }

  int _notaAula = 0;
  int get notaAula => _notaAula;
  set notaAula(int _value) {
    _notaAula = _value;
    secureStorage.setInt('ff_notaAula', _value);
  }

  void deleteNotaAula() {
    secureStorage.delete(key: 'ff_notaAula');
  }

  int _responderComentario = 0;
  int get responderComentario => _responderComentario;
  set responderComentario(int _value) {
    _responderComentario = _value;
    secureStorage.setInt('ff_responderComentario', _value);
  }

  void deleteResponderComentario() {
    secureStorage.delete(key: 'ff_responderComentario');
  }

  bool _darkMode = true;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    secureStorage.setBool('ff_darkMode', _value);
  }

  void deleteDarkMode() {
    secureStorage.delete(key: 'ff_darkMode');
  }

  bool _statusNET = true;
  bool get statusNET => _statusNET;
  set statusNET(bool _value) {
    _statusNET = _value;
  }

  bool _comenariovalido = false;
  bool get comenariovalido => _comenariovalido;
  set comenariovalido(bool _value) {
    _comenariovalido = _value;
  }

  String _linkExeternoAula = '';
  String get linkExeternoAula => _linkExeternoAula;
  set linkExeternoAula(String _value) {
    _linkExeternoAula = _value;
    secureStorage.setString('ff_linkExeternoAula', _value);
  }

  void deleteLinkExeternoAula() {
    secureStorage.delete(key: 'ff_linkExeternoAula');
  }

  int _IDcurso = 0;
  int get IDcurso => _IDcurso;
  set IDcurso(int _value) {
    _IDcurso = _value;
    secureStorage.setInt('ff_IDcurso', _value);
  }

  void deleteIDcurso() {
    secureStorage.delete(key: 'ff_IDcurso');
  }

  bool _aulaConcluida = false;
  bool get aulaConcluida => _aulaConcluida;
  set aulaConcluida(bool _value) {
    _aulaConcluida = _value;
    secureStorage.setBool('ff_aulaConcluida', _value);
  }

  void deleteAulaConcluida() {
    secureStorage.delete(key: 'ff_aulaConcluida');
  }

  List<dynamic> _listaSubModulo = [];
  List<dynamic> get listaSubModulo => _listaSubModulo;
  set listaSubModulo(List<dynamic> _value) {
    _listaSubModulo = _value;
    secureStorage.setStringList(
        'ff_listaSubModulo', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteListaSubModulo() {
    secureStorage.delete(key: 'ff_listaSubModulo');
  }

  void addToListaSubModulo(dynamic _value) {
    _listaSubModulo.add(_value);
    secureStorage.setStringList('ff_listaSubModulo',
        _listaSubModulo.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListaSubModulo(dynamic _value) {
    _listaSubModulo.remove(_value);
    secureStorage.setStringList('ff_listaSubModulo',
        _listaSubModulo.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListaSubModulo(int _index) {
    _listaSubModulo.removeAt(_index);
    secureStorage.setStringList('ff_listaSubModulo',
        _listaSubModulo.map((x) => jsonEncode(x)).toList());
  }

  void updateListaSubModuloAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listaSubModulo[_index] = updateFn(_listaSubModulo[_index]);
    secureStorage.setStringList('ff_listaSubModulo',
        _listaSubModulo.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInListaSubModulo(int _index, dynamic _value) {
    _listaSubModulo.insert(_index, _value);
    secureStorage.setStringList('ff_listaSubModulo',
        _listaSubModulo.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
