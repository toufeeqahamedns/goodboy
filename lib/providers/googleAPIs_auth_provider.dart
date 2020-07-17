import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleAPIsAuthProvider {
  static const List<String> SCOPES = [
    "https://www.googleapis.com/auth/cloud-platform"
  ];
  static const String SESSION_ID = "999";

  String _projectId;
  AccessCredentials _accessCredentials;

  Future<void> authenticate() async {
    try {
      await rootBundle.loadString("keys/auth.json").then((value) async {
        _projectId = json.decode(value)["project_id"];
        dynamic clientCredentials = new ServiceAccountCredentials.fromJson(value);

        await clientViaServiceAccount(clientCredentials, SCOPES).then((autoRefreshingAuthClient) {
          _accessCredentials = autoRefreshingAuthClient.credentials;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  bool get hasExpired {
    return _accessCredentials.accessToken.hasExpired;
  }

  String get getSessionId {
    return SESSION_ID;
  }

  String get getProjectId {
    return _projectId;
  }

  String get getToken {
    return _accessCredentials.accessToken.data;
  }
}