import 'dart:convert';
import 'dart:io';

import 'package:bankboo/config.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header {
  static Future<Map<String, dynamic>> authorization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<dynamic, String> credentials = jsonDecode(prefs.getString('credentials'));

    return {
      HttpHeaders.authorizationHeader: '${credentials["type"]} ${credentials["access_token"]}'
    };
  }
}

class Request {
  Response response;
  Dio dio = new Dio();

  Future<Response> signin({String endpoint, Map body}) async {
    try {
      response = await dio.post(
        '${Config.API}$endpoint',
        data: body,
      );

      return response;
    } catch (e) {
      throw(e);
    }
  }
  
  Future getList({String endpoint, int perPage}) async {
    try {
      
    } catch (e) {
    }
  }

  Future getDetail({String endpoint, String id}) async {
    try {
      
    } catch (e) {
    }
  }

  Future<Response> post({String endpoint, Map body}) async {
    try {
      response = await dio.post(
        '${Config.API}$endpoint',
        data: body,
        options: Options(
          headers: await Header.authorization()
        )
      );

      return response;
    } catch (e) {
      throw(e);
    }
  }

  Future patch({String endpoint, String id}) async {
    try {
      
    } catch (e) {
    }
  }

  Future delete({String endpoint, String id}) async {
    try {
      
    } catch (e) {
    }
  }
}