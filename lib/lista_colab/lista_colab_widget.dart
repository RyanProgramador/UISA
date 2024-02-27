import '/backend/api_requests/api_calls.dart';
import '/components/ops_nenhum_resultado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'lista_colab_model.dart';
export 'lista_colab_model.dart';

class ListaColabWidget extends StatefulWidget {
  const ListaColabWidget({
    super.key,
    required this.salaNome,
    required this.quantidadeDePessoas,
    required this.idIntegracao,
  });

  final String? salaNome;
  final String? quantidadeDePessoas;
  final String? idIntegracao;

  @override
  State<ListaColabWidget> createState() => _ListaColabWidgetState();
}

class _ListaColabWidgetState extends State<ListaColabWidget>
    with TickerProviderStateMixin {
  late ListaColabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 90.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaColabModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(ListaColabNaIntegCall.call(
              idIntegra: widget.idIntegracao,
              termoPesquisa: _model.textController.text,
              url: FFAppState().UrlApis,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xEBFFFFFF),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFFAA753),
                  ),
                ),
              ),
            ),
          );
        }
        final listaColabListaColabNaIntegResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xEBFFFFFF),
            appBar: AppBar(
              backgroundColor: const Color(0xEBFFFFFF),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Sala: ${widget.salaNome}',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 50),
                          () async {
                            setState(() => _model.apiRequestCompleter1 = null);
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Pesquisar nome...',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        minLines: 1,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Quantidade de pessoas:',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 12.0, 16.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.quantidadeDePessoas,
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (ListaColabNaIntegCall.statusColabIntegra(
                                  listaColabListaColabNaIntegResponse.jsonBody,
                                ) ==
                                true)
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter1 ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(
                                                  ListaColabNaIntegCall.call(
                                                idIntegra: widget.idIntegracao,
                                                termoPesquisa:
                                                    _model.textController.text,
                                                url: FFAppState().UrlApis,
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFFFAA753),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnListaColabNaIntegResponse =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (_model.textController.text == '')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final colaboradoresNaIntegracao =
                                                      getJsonField(
                                                    listaColabListaColabNaIntegResponse
                                                        .jsonBody,
                                                    r'''$.dados''',
                                                  ).toList();
                                                  if (colaboradoresNaIntegracao
                                                      .isEmpty) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.5,
                                                        child:
                                                            const OpsNenhumResultadoWidget(),
                                                      ),
                                                    );
                                                  }
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted2();
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          colaboradoresNaIntegracao
                                                              .length,
                                                      itemBuilder: (context,
                                                          colaboradoresNaIntegracaoIndex) {
                                                        final colaboradoresNaIntegracaoItem =
                                                            colaboradoresNaIntegracao[
                                                                colaboradoresNaIntegracaoIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          1.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              colaboradoresNaIntegracaoItem,
                                                                              r'''$.nome_colab''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFF9D1717),
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var shouldSetState = false;
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Tem certeza que deseja marcar ausência?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: const Text('Não'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: const Text('Sim'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                _model.apiResultedr = await PresenteOuAusenteCall.call(
                                                                                  idColaborador: getJsonField(
                                                                                    colaboradoresNaIntegracaoItem,
                                                                                    r'''$.colaborador_id''',
                                                                                  ).toString(),
                                                                                  idIntegracao: widget.idIntegracao,
                                                                                  usuarioMobile: FFAppState().NomeUsuario,
                                                                                  presenteOuAusente: 'N',
                                                                                  url: FFAppState().UrlApis,
                                                                                );
                                                                                shouldSetState = true;
                                                                                if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                  (_model.apiResultedr1?.jsonBody ?? ''),
                                                                                )!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Sucesso!'),
                                                                                        content: const Text('Ausência confirmada!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter2 = null);
                                                                                  await _model.waitForApiRequestCompleted2();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Ops!'),
                                                                                        content: const Text('um erro inesperado aconteceu!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter2 = null);
                                                                                  await _model.waitForApiRequestCompleted2();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (shouldSetState) setState(() {});
                                                                                return;
                                                                              }

                                                                              if (shouldSetState) {
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.close_sharp,
                                                                              color: Colors.white,
                                                                              size: 36.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFF24962D),
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var shouldSetState = false;
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Tem certeza que deseja marcar presença?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: const Text('Não'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: const Text('Sim'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                _model.apiResultedr1 = await PresenteOuAusenteCall.call(
                                                                                  idColaborador: getJsonField(
                                                                                    colaboradoresNaIntegracaoItem,
                                                                                    r'''$.colaborador_id''',
                                                                                  ).toString(),
                                                                                  idIntegracao: widget.idIntegracao,
                                                                                  usuarioMobile: FFAppState().NomeUsuario,
                                                                                  presenteOuAusente: 'S',
                                                                                  url: FFAppState().UrlApis,
                                                                                );
                                                                                shouldSetState = true;
                                                                                if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                  (_model.apiResultedr1?.jsonBody ?? ''),
                                                                                )!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Sucesso!'),
                                                                                        content: const Text('Presença confirmada!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter2 = null);
                                                                                  await _model.waitForApiRequestCompleted2();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Ops!'),
                                                                                        content: const Text('um erro inesperado aconteceu!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter2 = null);
                                                                                  await _model.waitForApiRequestCompleted2();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (shouldSetState) setState(() {});
                                                                                return;
                                                                              }

                                                                              if (shouldSetState) {
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.check_circle_outline,
                                                                              color: Colors.white,
                                                                              size: 36.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          if ((_model.textController.text !=
                                                      '') &&
                                              (ListaColabNaIntegCall
                                                      .statusColabIntegra(
                                                    columnListaColabNaIntegResponse
                                                        .jsonBody,
                                                  ) ==
                                                  true))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final colaboradoresNaIntegracao =
                                                      getJsonField(
                                                    columnListaColabNaIntegResponse
                                                        .jsonBody,
                                                    r'''$.dados''',
                                                  ).toList();
                                                  if (colaboradoresNaIntegracao
                                                      .isEmpty) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.8,
                                                        child:
                                                            const OpsNenhumResultadoWidget(),
                                                      ),
                                                    );
                                                  }
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() => _model
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted1();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          colaboradoresNaIntegracao
                                                              .length,
                                                      itemBuilder: (context,
                                                          colaboradoresNaIntegracaoIndex) {
                                                        final colaboradoresNaIntegracaoItem =
                                                            colaboradoresNaIntegracao[
                                                                colaboradoresNaIntegracaoIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          1.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              colaboradoresNaIntegracaoItem,
                                                                              r'''$.nome_colab''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFF9D1717),
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var shouldSetState = false;
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Tem certeza que deseja marcar ausência?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: const Text('Não'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: const Text('Sim'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                _model.apiResultedrCopy = await PresenteOuAusenteCall.call(
                                                                                  idColaborador: getJsonField(
                                                                                    columnListaColabNaIntegResponse.jsonBody,
                                                                                    r'''$.colaborador_id''',
                                                                                  ).toString(),
                                                                                  idIntegracao: widget.idIntegracao,
                                                                                  usuarioMobile: FFAppState().NomeUsuario,
                                                                                  presenteOuAusente: 'N',
                                                                                  url: FFAppState().UrlApis,
                                                                                );
                                                                                shouldSetState = true;
                                                                                if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                  (_model.apiResultedrCopy?.jsonBody ?? ''),
                                                                                )!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Sucesso!'),
                                                                                        content: const Text('Ausência confirmada!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Ops!'),
                                                                                        content: const Text('um erro inesperado aconteceu!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (shouldSetState) setState(() {});
                                                                                return;
                                                                              }

                                                                              if (shouldSetState) {
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.close_sharp,
                                                                              color: Colors.white,
                                                                              size: 36.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFF24962D),
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var shouldSetState = false;
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Tem certeza que deseja marcar presença?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: const Text('Não'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: const Text('Sim'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                _model.apiResultedr1Copy = await PresenteOuAusenteCall.call(
                                                                                  idColaborador: getJsonField(
                                                                                    columnListaColabNaIntegResponse.jsonBody,
                                                                                    r'''$.colaborador_id''',
                                                                                  ).toString(),
                                                                                  idIntegracao: widget.idIntegracao,
                                                                                  usuarioMobile: FFAppState().NomeUsuario,
                                                                                  presenteOuAusente: 'S',
                                                                                  url: FFAppState().UrlApis,
                                                                                );
                                                                                shouldSetState = true;
                                                                                if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                  (_model.apiResultedr1?.jsonBody ?? ''),
                                                                                )!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Sucesso!'),
                                                                                        content: const Text('Presença confirmada!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Ops!'),
                                                                                        content: const Text('um erro inesperado aconteceu!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                  FFAppState().update(() {});
                                                                                  if (shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (shouldSetState) setState(() {});
                                                                                return;
                                                                              }

                                                                              if (shouldSetState) {
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.check_circle_outline,
                                                                              color: Colors.white,
                                                                              size: 36.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (ListaColabNaIntegCall.statusColabIntegra(
                                  listaColabListaColabNaIntegResponse.jsonBody,
                                ) ==
                                false)
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 240.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x2B202529),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 44.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 4.0),
                                            child: Text(
                                              'Ops!',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall,
                                            ),
                                          ),
                                          Text(
                                            'Parece que não há mais colaboradores nesta integração para serem auditados!',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                ),
                              ),
                            Flexible(
                              child: FutureBuilder<ApiCallResponse>(
                                future: ColaboradoresPresentesEAusenteCall.call(
                                  integracaoId: widget.idIntegracao,
                                  url: FFAppState().UrlApis,
                                  termoPesquisa: _model.textController.text,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFAA753),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final containerColaboradoresPresentesEAusenteResponse =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Visibility(
                                      visible:
                                          ColaboradoresPresentesEAusenteCall
                                                  .statusColabPresentAusent(
                                                containerColaboradoresPresentesEAusenteResponse
                                                    .jsonBody,
                                              ) ==
                                              true,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Pessoas já auditadas',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          ColaboradoresPresentesEAusenteCall
                                                              .call(
                                                        integracaoId:
                                                            widget.idIntegracao,
                                                        url: FFAppState()
                                                            .UrlApis,
                                                        termoPesquisa: _model
                                                            .textController
                                                            .text,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFFFAA753),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final listViewColaboradoresPresentesEAusenteResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final colaboradoresNaIntegracao =
                                                                getJsonField(
                                                              containerColaboradoresPresentesEAusenteResponse
                                                                  .jsonBody,
                                                              r'''$.dados''',
                                                            ).toList();
                                                            if (colaboradoresNaIntegracao
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    SizedBox(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.5,
                                                                  child:
                                                                      const OpsNenhumResultadoWidget(),
                                                                ),
                                                              );
                                                            }
                                                            return RefreshIndicator(
                                                              onRefresh:
                                                                  () async {
                                                                setState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              },
                                                              child: ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    colaboradoresNaIntegracao
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        colaboradoresNaIntegracaoIndex) {
                                                                  final colaboradoresNaIntegracaoItem =
                                                                      colaboradoresNaIntegracao[
                                                                          colaboradoresNaIntegracaoIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                0.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            offset:
                                                                                const Offset(0.0, 1.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        colaboradoresNaIntegracaoItem,
                                                                                        r'''$.nome_colab''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Colaborador ${getJsonField(
                                                                                        colaboradoresNaIntegracaoItem,
                                                                                        r'''$.presenca''',
                                                                                      ).toString()}',
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontWeight: FontWeight.w300,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 150.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xFF9D1717),
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                    ),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        var shouldSetState = false;
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Tem certeza que deseja marcar ausência?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: const Text('Não'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: const Text('Sim'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          _model.apiResultedr2 = await PresenteOuAusenteCall.call(
                                                                                            idColaborador: getJsonField(
                                                                                              colaboradoresNaIntegracaoItem,
                                                                                              r'''$.colaborador_id''',
                                                                                            ).toString(),
                                                                                            idIntegracao: widget.idIntegracao,
                                                                                            usuarioMobile: FFAppState().NomeUsuario,
                                                                                            presenteOuAusente: 'N',
                                                                                            url: FFAppState().UrlApis,
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                            (_model.apiResultedr2?.jsonBody ?? ''),
                                                                                          )!) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Sucesso!'),
                                                                                                  content: const Text('Ausência confirmada!'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: const Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            setState(() => _model.apiRequestCompleter2 = null);
                                                                                            await _model.waitForApiRequestCompleted2();
                                                                                            FFAppState().update(() {});
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Ops!'),
                                                                                                  content: const Text('um erro inesperado aconteceu!'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: const Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            setState(() => _model.apiRequestCompleter2 = null);
                                                                                            await _model.waitForApiRequestCompleted2();
                                                                                            FFAppState().update(() {});
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        } else {
                                                                                          if (shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }

                                                                                        if (shouldSetState) setState(() {});
                                                                                      },
                                                                                      child: const Icon(
                                                                                        Icons.close_sharp,
                                                                                        color: Colors.white,
                                                                                        size: 36.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xFF24962D),
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                    ),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        var shouldSetState = false;
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Tem certeza que deseja marcar presença?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: const Text('Não'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: const Text('Sim'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          _model.apiResultedr12 = await PresenteOuAusenteCall.call(
                                                                                            idColaborador: getJsonField(
                                                                                              colaboradoresNaIntegracaoItem,
                                                                                              r'''$.colaborador_id''',
                                                                                            ).toString(),
                                                                                            idIntegracao: widget.idIntegracao,
                                                                                            usuarioMobile: FFAppState().NomeUsuario,
                                                                                            presenteOuAusente: 'S',
                                                                                            url: FFAppState().UrlApis,
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          if (PresenteOuAusenteCall.statusPresenteOuAusente(
                                                                                            (_model.apiResultedr12?.jsonBody ?? ''),
                                                                                          )!) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Sucesso!'),
                                                                                                  content: const Text('Presença confirmada!'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: const Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            setState(() => _model.apiRequestCompleter2 = null);
                                                                                            await _model.waitForApiRequestCompleted2();
                                                                                            FFAppState().update(() {});
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Ops!'),
                                                                                                  content: const Text('um erro inesperado aconteceu!'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: const Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            setState(() => _model.apiRequestCompleter2 = null);
                                                                                            await _model.waitForApiRequestCompleted2();
                                                                                            FFAppState().update(() {});
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        } else {
                                                                                          if (shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }

                                                                                        if (shouldSetState) setState(() {});
                                                                                      },
                                                                                      child: const Icon(
                                                                                        Icons.check_circle_outline,
                                                                                        color: Colors.white,
                                                                                        size: 36.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
