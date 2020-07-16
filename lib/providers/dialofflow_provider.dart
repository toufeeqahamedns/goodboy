import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodboy/providers/googleAPIs_auth_provider.dart';

class DialogFlowProvider {
  static const BASE_URL = "https://dialogflow.googleapis.com/v2/projects/";
  static const LANG = "en";

  static final Dio _dio = new Dio(BaseOptions(baseUrl: BASE_URL));

  final GoogleAPIsAuthProvider _googleAPIsAuthProvider;

  DialogFlowProvider({@required GoogleAPIsAuthProvider googleAPIsAuthProvider})
      : assert(googleAPIsAuthProvider != null),
        _googleAPIsAuthProvider = googleAPIsAuthProvider;

  Future<dynamic> post(input) async {
    return await _dio.post(
        "${_googleAPIsAuthProvider.getProjectId}/agent/sessions/${_googleAPIsAuthProvider.getSessionId}:detectIntent",
        data: {
          "queryInput": {
            "text": {"text": "$input", "language_code": "$LANG"}
          },
        });
  }

  Future<dynamic> detectIntent(dynamic input) async {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addAll({
          HttpHeaders.authorizationHeader:
              "Bearer ${_googleAPIsAuthProvider.getToken}"
        });
        return options;
      }, onError: (DioError error) async {
        print(error);
      }),
    );

    // #747ffc

    if (!_googleAPIsAuthProvider.hasExpired) {
      Response<dynamic> response = await post(input);
      return Map.from(response.data);
    } else {
      await _googleAPIsAuthProvider.authenticate();
      Response<dynamic> response = await post(input);
      return Map.from(response.data);
    }
  }
}
