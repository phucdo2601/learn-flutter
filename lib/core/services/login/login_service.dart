import 'package:learn_login_full_with_api_b02/core/interfaces/login/login_interface.dart';
import 'package:learn_login_full_with_api_b02/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginSerivce extends ILogin {
  @override
  Future<UserModel> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {
      "email": email,
      "password": password,
    };
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if(response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = response.data;
      await storage.setString('TOKEN', body['token']);
      await storage.setString('EMAIL', email);
      return UserModel(email: email, token: body['token']);
    } else {
      return UserModel(email: "", token: "");
    }
  }

  @override
  Future<UserModel> loginHttp(String email, String password) async {
    final api = Uri.parse('https://reqres.in/api/login');
    final data = {"email": email, "password": password};
    // final dio = Dio();

    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('EMAIL', email);
      return UserModel(email: email, token: body['token']);
    } else {
      return UserModel(email: "", token: "");
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserModel> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } else {
      return UserModel(email: "", token: "");
    }
  }
}