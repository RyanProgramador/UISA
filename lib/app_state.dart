import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    _safeInit(() {
      if (prefs.containsKey('ff_JsonX')) {
        try {
          _JsonX = jsonDecode(prefs.getString('ff_JsonX') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_jsonS')) {
        try {
          _jsonS = jsonDecode(prefs.getString('ff_jsonS') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_JsonN')) {
        try {
          _JsonN = jsonDecode(prefs.getString('ff_JsonN') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _StringN = prefs.getStringList('ff_StringN') ?? _StringN;
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

  dynamic _JsonX;
  dynamic get JsonX => _JsonX;
  set JsonX(dynamic value) {
    _JsonX = value;
    prefs.setString('ff_JsonX', jsonEncode(value));
  }

  dynamic _jsonS;
  dynamic get jsonS => _jsonS;
  set jsonS(dynamic value) {
    _jsonS = value;
    prefs.setString('ff_jsonS', jsonEncode(value));
  }

  dynamic _JsonN;
  dynamic get JsonN => _JsonN;
  set JsonN(dynamic value) {
    _JsonN = value;
    prefs.setString('ff_JsonN', jsonEncode(value));
  }

  List<String> _StringN = [];
  List<String> get StringN => _StringN;
  set StringN(List<String> value) {
    _StringN = value;
    prefs.setStringList('ff_StringN', value);
  }

  void addToStringN(String value) {
    _StringN.add(value);
    prefs.setStringList('ff_StringN', _StringN);
  }

  void removeFromStringN(String value) {
    _StringN.remove(value);
    prefs.setStringList('ff_StringN', _StringN);
  }

  void removeAtIndexFromStringN(int index) {
    _StringN.removeAt(index);
    prefs.setStringList('ff_StringN', _StringN);
  }

  void updateStringNAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _StringN[index] = updateFn(_StringN[index]);
    prefs.setStringList('ff_StringN', _StringN);
  }

  void insertAtIndexInStringN(int index, String value) {
    _StringN.insert(index, value);
    prefs.setStringList('ff_StringN', _StringN);
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
