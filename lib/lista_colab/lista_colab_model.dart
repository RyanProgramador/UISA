import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'lista_colab_widget.dart' show ListaColabWidget;
import 'package:flutter/material.dart';

class ListaColabModel extends FlutterFlowModel<ListaColabWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedr;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedr1;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedrCopy;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedr1Copy;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedr2;
  // Stores action output result for [Backend Call - API (PresenteOuAusente)] action in Icon widget.
  ApiCallResponse? apiResultedr12;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
