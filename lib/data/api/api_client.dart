import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../utilities/local_storage_service.dart';
import 'api_constants.dart';
import 'models/api_exception.dart';

///This is a super class for handling all api integration.
class ApiClient {
  late Dio client;
  late LocalStorageService localStorageService;

  final _baseOptions = BaseOptions(
    headers: {
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Apikey": ""
    },
  );

  ApiClient(LocalStorageService localStorage, {String? baseUrl}) {
    client = Dio(
      _baseOptions..baseUrl = baseUrl ?? ApiConstants.baseUrl,
    );
    localStorageService = localStorage;
  }

  // static Future<dynamic> _getbody({bool? withToken, dynamic bodyData}) async {
  //   if (withToken == true) {
  //     final storageToken = await StorageHelper.get(StorageKeys.token);
  //     log(storageToken.toString());
  //     var body = {StorageKeys.token: storageToken};
  //     bodyData = {...body};
  //   }
  //   return jsonEncode(bodyData);
  // }

  // GET Request
  Future<Response> getData({
    required String apiName,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    bool tokenEnabled = true,
    String contentType = 'application/json',
  }) async {
    //holds request options
    Options options = Options(
      responseType: ResponseType.json,
      contentType: contentType,
    );

    //checks if request requires token
    if (tokenEnabled) {
      //get token from localDb
      // final tokenId =
      //     await localStorage.readValue(key: localStorage.tokenIdKey);
      options.headers = _baseOptions.headers
        ..addAll(_baseOptions.headers)
        ..addAll({'Authorization': 'Bearer ---'});
      // ..addAll({'Authorization': 'Bearer $tokenId'});
    }
    debugPrint('================API REQUEST================');
    debugPrint('TOKEN: ${options.headers?["Authorization"]}');
    // debugPrint('REQUEST BODY: $body');
    try {
      final response = await client.get(
        apiName,
        // queryParameters: queryParameters,
        // onReceiveProgress: onReceiveProgress,
        // options: options,
      );

      debugPrint('================API RESPONSE================');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('DATA: ${response.data}');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('DioError: ${e.response!.statusMessage}');
        if (e.response!.data['responseCode'] == '205062' ||
            e.response?.data['responseCode'] == '205000') {
          throw ApiException(e.response!.data['message'], tokenExpired: true);
        } else {
          throw ApiException(e.response!.statusMessage);
        }
      } else {
        debugPrint('DioError: ${e.message}');
        throw ApiException(e.message);
      }
    }
  }

  // POST Request
  Future<Response> postData({
    //renamed path to something like apiName. - Suggested by Aya.
    required String apiName,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    bool tokenEnabled = true,
    String contentType = Headers.formUrlEncodedContentType,
    dynamic body,
  }) async {
    Options options = Options(
        responseType: ResponseType.json,
        contentType: contentType,
        headers: {"Content-Type": "application/json"});

    //checks if request requires token
    if (tokenEnabled) {
      //get token from localDb
      // final tokenId =
      //     await localStorage.readValue(key: localStorage.tokenIdKey);
    }
    debugPrint('================API REQUEST================');
    debugPrint('REQUEST BODY: $apiName');
    debugPrint('TOKEN: ${options.headers?["Authorization"]}');
    debugPrint('REQUEST BODY: $body');
    try {
      final response = await client.post(
        apiName,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: options,
        data: body,
      );
      debugPrint('================API RESPONSE================');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('DATA: ${response.data}');
      return response;
    } on DioError catch (e) {
      //any logging platform can be configured like firebase crashlytics
      if (e.response != null) {
        debugPrint('DioError: ${e.response?.statusMessage}');
        if ((e.response?.data["response"] ?? e.response?.data["error"])
            .contains("Session expired!")) {}
        throw ApiException(e.response?.data);
      } else {
        debugPrint('DioError: ${e.message}');
        throw ApiException(e.message);
      }
    }
  }

  // Update or PUT Request
  Future<Response> updateData({
    required String apiName,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool tokenEnabled = true,
    String contentType = 'application/json',
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final requestBody = jsonEncode(body);

    //holds request options
    Options options = Options(
      responseType: ResponseType.json,
      contentType: contentType,
    );

    //checks if request requires token
    if (tokenEnabled) {
      //get token from localDb
      // final tokenId =
      //     await localStorage.readValue(key: localStorage.tokenIdKey);
      options.headers = _baseOptions.headers
        ..addAll(_baseOptions.headers)
        ..addAll({'Authorization': 'Bearer ---'});
      // ..addAll({'Authorization': 'Bearer $tokenId'});
    }
    debugPrint('================API REQUEST================');
    debugPrint('TOKEN: ${options.headers?["Authorization"]}');
    debugPrint('REQUEST BODY: $body');
    try {
      final response = await client.put(
        apiName,
        queryParameters: queryParameters,
        options: options,
        data: requestBody,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      debugPrint('================API RESPONSE================');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('DATA: ${response.data}');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('DioError: ${e.response!.statusMessage}');
        if (e.response!.data['responseCode'] == '205062' ||
            e.response?.data['responseCode'] == '205000') {
          throw ApiException(e.response!.data['message'], tokenExpired: true);
        } else {
          throw ApiException(e.response!.statusMessage);
        }
      } else {
        debugPrint('DioError: ${e.message}');
        throw ApiException(e.message);
      }
    }
  }

  // DELETE request
  Future<Response> deleteData({
    required String apiName,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool tokenEnabled = true,
    String contentType = 'application/json; charset=UTF-8',
  }) async {
    final requestBody = jsonEncode(body);

    //holds request options
    Options options = Options(
      responseType: ResponseType.json,
      contentType: contentType,
    );

    //checks if request requires token
    // if (tokenEnabled) {
    //   //get token from localDb
    //   // final tokenId =
    //   //     await localStorage.readValue(key: localStorage.tokenIdKey);
    //   _options.headers = _baseOptions.headers
    //     ..addAll(_baseOptions.headers)
    //     ..addAll({'Authorization': 'Bearer ---'});
    //   // ..addAll({'Authorization': 'Bearer $tokenId'});
    // }
    debugPrint('================API REQUEST================');
    debugPrint('TOKEN: ${options.headers?["Authorization"]}');
    debugPrint('REQUEST BODY: $body');
    try {
      final response = await client.delete(
        apiName,
        queryParameters: queryParameters,
        options: options,
        data: requestBody,
      );

      debugPrint('================API RESPONSE================');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('DATA: ${response.data}');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('DioError: ${e.response!.statusMessage}');
        if (e.response!.data['responseCode'] == '205062' ||
            e.response?.data['responseCode'] == '205000') {
          throw ApiException(e.response!.data['message'], tokenExpired: true);
        } else {
          throw ApiException(e.response!.statusMessage);
        }
      } else {
        debugPrint('DioError: ${e.message}');
        throw ApiException(e.message);
      }
    }
  }

  ///Update Token in the header.
  Future<void> updateToken(String token) async {
    debugPrint('================NEW TOKEN================');
    debugPrint('NEW TOKEN: $token');

    try {
      // await localStorage.writeValue<String>(
      //     key: localStorage.tokenIdKey, value: token);
      _baseOptions.headers.remove('Authorization');
      _baseOptions.headers.addAll({'Authorization': 'Bearer ---'});
      // .addAll({'Authorization': 'Bearer $tokenId'});
    } on Exception catch (e) {
      debugPrint('TokenError: $e');

      rethrow;
    }
  }
}
