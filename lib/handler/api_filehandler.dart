import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future<dynamic> login({id, password}) async {
  final body = {
    "identification_number": id.toString(),
    "password": password.toString()
  };
  Dio dio = Dio();
  var response = await dio.post("http://127.0.0.1:8000/api/auth/token/",
      data: jsonEncode(body));
  return response;
}

Future<dynamic> register(body) async {
  Dio dio = Dio();
  var response = await dio.post("http://127.0.0.1:8000/api/auth/register_user/",
      data: body);
  return response;
}

Future<dynamic> submitIdForm(body) async {
  print(body.toString());
  Dio dio = Dio();
  var response =
      await dio.post("http://127.0.0.1:8000/api/app/app_id/", data: body);
  return response;
}

Future<dynamic> getServiceList() async {
  Dio dio = Dio();
  var response =
      await dio.get("http://127.0.0.1:8000/api/services/service_list/");
  return response;
}

Future<dynamic> submitFeedback(body) async {
  Dio dio = Dio();
  var response =
      await dio.post("http://127.0.0.1:8000/api/feedback/", data: body);
  return response;
}

Future<dynamic> submitAppointment(body) async {
  Dio dio = Dio();
  var response = await dio.post("http://127.0.0.1:8000/api/app/", data: body);
  return response;
}

Future getServices() async {
  Dio dio = Dio();
  var response =
      await dio.get('https://api.nbp.pl/api/cenyzlota/last/10/?format=json');

  return response;
}

Future<Response> getDescription(String text) async {
  Dio dio = Dio();
  const url = "https://api.nbp.pl/api/cenyzlota/last/10/?format=json";

  var response = await dio.get('$url/$text');
  return response;
}
