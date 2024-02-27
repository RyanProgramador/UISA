import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _login = prefs.getString('ff_login') ?? _login;
    });
    _safeInit(() {
      _senha = prefs.getString('ff_senha') ?? _senha;
    });
    _safeInit(() {
      _NomeUsuario = prefs.getString('ff_NomeUsuario') ?? _NomeUsuario;
    });
    _safeInit(() {
      _dataDoUltimoLogin = prefs.containsKey('ff_dataDoUltimoLogin')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_dataDoUltimoLogin')!)
          : _dataDoUltimoLogin;
    });
    _safeInit(() {
      _senhaSenha = prefs.getString('ff_senhaSenha') ?? _senhaSenha;
    });
    _safeInit(() {
      _UrlApis = prefs.getString('ff_UrlApis') ?? _UrlApis;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _login = '';
  String get login => _login;
  set login(String value) {
    _login = value;
    prefs.setString('ff_login', value);
  }

  String _senha = '';
  String get senha => _senha;
  set senha(String value) {
    _senha = value;
    prefs.setString('ff_senha', value);
  }

  String _NomeUsuario = '';
  String get NomeUsuario => _NomeUsuario;
  set NomeUsuario(String value) {
    _NomeUsuario = value;
    prefs.setString('ff_NomeUsuario', value);
  }

  DateTime? _dataDoUltimoLogin;
  DateTime? get dataDoUltimoLogin => _dataDoUltimoLogin;
  set dataDoUltimoLogin(DateTime? value) {
    _dataDoUltimoLogin = value;
    value != null
        ? prefs.setInt('ff_dataDoUltimoLogin', value.millisecondsSinceEpoch)
        : prefs.remove('ff_dataDoUltimoLogin');
  }

  String _senhaSenha = '';
  String get senhaSenha => _senhaSenha;
  set senhaSenha(String value) {
    _senhaSenha = value;
    prefs.setString('ff_senhaSenha', value);
  }

  String _UrlApis =
      'https://dev.conceittosistemas.com.br/scriptcase/app/Documento_Terceiros/ws_flutterflow/index.php';
  String get UrlApis => _UrlApis;
  set UrlApis(String value) {
    _UrlApis = value;
    prefs.setString('ff_UrlApis', value);
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
