import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future<dynamic> login({id, password}) async {
  const body = {"value": "abc-def-ghi", "id": 12345};
  Dio dio = Dio();
  var response =
      await dio.post("https://4yr9r.wiremockapi.cloud/json", data: body);
  return response;
}
