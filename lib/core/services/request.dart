import 'dart:convert';
import 'dart:io';

import 'package:bankboo/config.dart';
import 'package:bankboo/shared/models/generic_fetch_error.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Method { GET, POST, PATCH, PUT, DELETE }
class Header {
  static Future<Map<String, dynamic>> authorization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(jsonDecode(prefs.getString('credentials')));
    Map<String, dynamic> credentials = jsonDecode(prefs.getString('credentials'));

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
      response = await dio.get(
        '${Config.API}$endpoint',
        options: Options(
          headers: await Header.authorization()
        )
      );

      return response;
    } catch (e) {
      throw(e);
    }
  }

  Future getDetail({String endpoint, String id}) async {
    try {
      
    } catch (e) {
    }
  }

  Future<Response> global({ Method method, String url, dynamic headers, dynamic body}) async {

    try {
      switch (method) {
        case Method.GET:
          response = await dio.get(
            url,
            options: Options(
              headers: headers
            ),
          );
          break;
        case Method.POST:
          response = await dio.post(
            url,
            options: Options(
              headers: headers
            ),
            data: body
          );
          break;
        case Method.PATCH:
          response = await dio.patch(
            url,
            options: Options(
              headers: headers
            ),
            data: body
          );
          break;
        case Method.PUT:
          response = await dio.put(
            url,
            options: Options(
              headers: headers
            ),
            data: body
          );
          break;
        case Method.DELETE:
          response = await dio.delete(
            url,
            options: Options(
              headers: headers
            ),
            data: body
          );
          break;
        default:
      }

      return response;
    } catch (e) {
      GenericFetchError responseError = GenericFetchError.fromJson(e.response.data);
      throw(responseError);
    }
  }

}