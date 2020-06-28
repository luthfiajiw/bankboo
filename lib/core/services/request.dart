import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

mixin Request {
  Future getList({String endpoint, int perPage}) async {}

  Future getDetail({String endpoint, String id}) async {}

  Future post({String endpoint}) async {}

  Future patch({String endpoint, String id}) async {}

  Future delete({String endpoint, String id}) async {}
}

class Header {
  static Future<Map<String, dynamic>> authorization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<dynamic, String> credentials = jsonDecode(prefs.getString('credentials'));

    return {
      HttpHeaders.authorizationHeader: '${credentials["type"]} ${credentials["access_token"]}'
    };
  }
}