import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> get({required String url}) async {
    var response = await Dio().get(url);
    return response.data;
  }
}
