import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../models/login_model.dart';
import '../models/taskmodel.dart';

class Service {
  final String baseUrl = "https://nottapp.herokuapp.com/";
  final dio = Dio();

  Future<LoginModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    var response = await dio.post(baseUrl + "login", data: json);
    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(response.data);
      print("Gelen response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.data}");
    }
  }

  Future<TaskModel?> taskCall() async {
    String token = await GetStorage().read("token");
    var response = await dio.get(baseUrl + "list",
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      var result = TaskModel.fromJson(response.data);
      print("Gelen response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
 