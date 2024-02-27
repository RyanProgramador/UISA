// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StringnomeStruct extends BaseStruct {
  StringnomeStruct({
    String? nome,
  }) : _nome = nome;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  static StringnomeStruct fromMap(Map<String, dynamic> data) =>
      StringnomeStruct(
        nome: data['nome'] as String?,
      );

  static StringnomeStruct? maybeFromMap(dynamic data) => data is Map
      ? StringnomeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
      }.withoutNulls;

  static StringnomeStruct fromSerializableMap(Map<String, dynamic> data) =>
      StringnomeStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StringnomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StringnomeStruct && nome == other.nome;
  }

  @override
  int get hashCode => const ListEquality().hash([nome]);
}

StringnomeStruct createStringnomeStruct({
  String? nome,
}) =>
    StringnomeStruct(
      nome: nome,
    );
