// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    DateTime? hora,
  }) : _hora = hora;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  set hora(DateTime? val) => _hora = val;
  bool hasHora() => _hora != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        hora: data['hora'] as DateTime?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'hora': _hora,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hora': serializeParam(
          _hora,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        hora: deserializeParam(
          data['hora'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct && hora == other.hora;
  }

  @override
  int get hashCode => const ListEquality().hash([hora]);
}

DataStruct createDataStruct({
  DateTime? hora,
}) =>
    DataStruct(
      hora: hora,
    );
