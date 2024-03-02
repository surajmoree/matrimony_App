import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../config/constants/app_config.dart';

class Api {
  final _host = host;
  final _protocol = httpProtocol;
  final stringToBase64Url = utf8.fuse(base64Url);

  Future<Map> requestGET(
      {required String path, Map<String, Object>? parameters}) async {
    bool chk = parameters!.containsKey("token");
    var headersData = _headers;
    if (chk) {
      headersData['x-access-token'] = 'Bearer ${parameters['token']}';
      //  dynamic res = parameters.remove('token');
    }
    dynamic uri;
    if (_protocol == 'https') {
      uri = Uri.https(_host, path, parameters);
    } else {
      uri = Uri.http(_host, path, parameters);
    }
    // ignore: avoid_print
    print(uri);
    final results = await http.get(uri, headers: headersData);
    if (results.body.isNotEmpty) {
      final jsonObject = json.decode(results.body);
      // TO DO: Try to validate the code and remve if not needed 
      // if (jsonObject['status'] == 'expired') box.erase();
      return jsonObject;
    } else {
      return {};
    }
  }

  Future<Map> requestPUT(
      {@required String? path, Map<String, Object>? parameters}) async {
    bool chk = parameters!.containsKey("token");
    var headersData = _headers;
    if (chk) {
      headersData['x-access-token'] = 'Bearer ${parameters['token']}';
      if (parameters.containsKey('token-type')) {
        headersData['token-type'] = parameters['token-type'].toString();
      }
    }
    dynamic uri;
    if (_protocol == 'https') {
      uri = Uri.https(_host, path!);
    } else {
      uri = Uri.http(_host, path!);
    }
    // ignore: avoid_print
    print(uri);
    final results = await http.put(uri, headers: headersData, body: parameters);

    if (results.body.isNotEmpty) {
      final jsonObject = jsonDecode(results.body);
      // TO DO: Try to validate the code and remve if not needed 
      // if (jsonObject['status'] == 'expired') box.erase();
      return jsonObject;
    } else {
      return {};
    }
  }

  Future<Map> requestPOST(
      {@required String? path, Map<String, Object>? parameters}) async {
    // bool netStatus = await checkInternet();
    bool chk = parameters!.containsKey("token");
    var headersData = _headers;
    dynamic res = parameters;
    if (chk) {
      headersData['x-access-token'] = 'Bearer ${parameters['token']}';
      if (parameters.containsKey('token-type')) {
        headersData['token-type'] = parameters['token-type'].toString();
      }
    }

    dynamic uri;
    if (_protocol == 'https') {
      uri = Uri.https(_host, path!);
    } else {
      uri = Uri.http(_host, path!);
    }
    // ignore: avoid_print
    print(uri);
    final results = await http.post(uri, headers: headersData, body: res);
    if (results.body.isNotEmpty) {
      final jsonObject = json.decode(results.body);
      // TO DO: Try to validate the code and remve if not needed 
      // if (jsonObject['status'] == 'expired') box.erase();
      return jsonObject;
    } else {
      return {};
    }
  }

  Future<Map> requestDELETE(
      {@required String? path, Map<String, Object>? parameters}) async {
    bool chk = parameters!.containsKey("token");
    var headersData = _headers;
    if (chk) {
      headersData['x-access-token'] = 'Bearer ${parameters['token']}';
      if (parameters.containsKey('token-type')) {
        headersData['token-type'] = parameters['token-type'].toString();
      }
    }
    dynamic uri;
    if (_protocol == 'https') {
      uri = Uri.https(_host, path!);
    } else {
      uri = Uri.http(_host, path!);
    }
    final results =
        await http.delete(uri, headers: headersData, body: parameters);
    // ignore: avoid_print
    print(uri);
    if (results.body.isNotEmpty) {
      final jsonObject = jsonDecode(results.body);
      // TO DO: Try to validate the code and remve if not needed 
      // if (jsonObject['status'] == 'expired') box.erase();
      return jsonObject;
    } else {
      return {};
    }
  }

 dynamic stringToBase64(data) {
  return stringToBase64Url.decode(data);
 }

  Map<String, String> get _headers => {'Accept': 'application/json'};
}
