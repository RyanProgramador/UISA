import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? login = '',
    String? senha = '',
    String? url = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_login",
  "login": "$login",
  "senha": "$senha"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '$url',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static bool? statusLogin(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? msgLogin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? emailLogin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? usuarioLogin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.usuario''',
      ));
}

class ListaIntegracoesCall {
  static Future<ApiCallResponse> call({
    String? url =
        'https://gestaoterceiros.uisa.com.br/gt/ws_flutterflow/index.php',
  }) async {
    const ffApiRequestBody = '''
{
  "tipo": "apk_listar_integracoes"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listaIntegracoes',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/Documento_Terceiros/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusListarIntegracoes(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<int>? salasIDListarIntegracoes(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].salas_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? horaInicioListarIntegracoes(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].hora_inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataListarIntegracoes(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? descricaoListarIntegracoes(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idListarIntegracoes(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? dados(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List<int>? quatidadeinscritosListarIntegracoes(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].quatidade_inscritos''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ListaColabNaIntegCall {
  static Future<ApiCallResponse> call({
    String? idIntegra = '',
    String? termoPesquisa = '',
    String? url = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_lista_colaboradores_inegracoes",
  "integracao_id": "$idIntegra",
  "termo_de_pesquisa": "$termoPesquisa"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listaColabNaInteg',
      apiUrl: '$url',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusColabIntegra(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? dadosColabIntegra(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List<int>? colabIdColabIntegra(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].colaborador_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? confirmPresencaColabIntegra(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].confirmou_presenca''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? presencaColabIntegra(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].presenca''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeColaboradorColabIntegra(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].nome_colab''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fotoColaboradorColaboradorColabIntegra(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].foto_colab''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PresenteOuAusenteCall {
  static Future<ApiCallResponse> call({
    String? idColaborador = '',
    String? idIntegracao = '',
    String? usuarioMobile = '',
    String? presenteOuAusente = '',
    String? url = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_confirma_presenca_ausencia",
  "id_colab": "$idColaborador",
  "id_integra": "$idIntegracao",
  "usuario_mobile": "$usuarioMobile",
  "presencaOuAusencia": "$presenteOuAusente"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PresenteOuAusente',
      apiUrl: '$url',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusPresenteOuAusente(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class EsqueciSenhaCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? url = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_esqueci_senha",
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EsqueciSenha',
      apiUrl: '$url',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusEsqueciSenha(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? msgEsqueciSenha(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ColaboradoresPresentesEAusenteCall {
  static Future<ApiCallResponse> call({
    String? integracaoId = '',
    String? url = '',
    String? termoPesquisa = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_lista_colaboradores_presentes_e_ausentes",
  "integracao_id": "$integracaoId",
  "termo_de_pesquisa": "$termoPesquisa"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Colaboradores presentes e ausente',
      apiUrl: '$url',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? presencaColabPresentAusent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dados[:].presenca''',
      ));
  static String? nomeColabColabPresentAusent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dados[:].nome_colab''',
      ));
  static List? dadosColabPresentAusent(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static bool? statusColabPresentAusent(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? colaboradorIDColabPresentAusent(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dados[:].colaborador_id''',
      ));
  static String? confirmouPresencaColabPresentAusent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dados[:].confirmou_presenca''',
      ));
  static String? msgColabPresentAusent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LoginDinamicoCall {
  static Future<ApiCallResponse> call({
    String? urlDoApp = '',
    String? login = '',
    String? senha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_login",
  "login": "$login",
  "senha": "$senha"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginDinamico',
      apiUrl: '$urlDoApp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
