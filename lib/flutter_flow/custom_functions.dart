import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

DateTime? stringToDateTime(String? dateString) {
  if (dateString == null) {
    // Handle null input or return null
    print('Input string is null');
    return null;
  }

  try {
    return DateTime.parse(dateString);
  } catch (e) {
    // Handle the error or return null if the string is not a valid date
    print('Error parsing date: $e');
    return null;
  }
}

String? funcaoIf(String? ouXouSouN) {
  if (ouXouSouN == "X" || ouXouSouN == "x") {
    return "Nulo";
  } else if (ouXouSouN == "S" || ouXouSouN == "s") {
    return "Presente";
  } else if (ouXouSouN == "N" || ouXouSouN == "n") {
    return "Ausente";
  } else {
    return "Valor inválido"; // Adicionado para lidar com qualquer outro valor que não seja X, x, S, s, N, ou n.
  }
}

bool? funcaoifStatus(bool? status) {
  return status;
}
