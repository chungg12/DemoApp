import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> postLogin(int id, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl();

  @override
  Future<LoginModel> postLogin(int id, String password) => post('/test');

  Future<LoginModel> post(String url) async {
    var dio = Dio();
    final response = await dio.post(url, data: {'id': 123, 'password': 'abc'});

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
