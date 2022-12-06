import 'package:clean_architecture_tdd_course/features/login/domain/entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    required int id,
    required String password,
  }) : super(id, password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json['id'] as int, password: json['password'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
    };
  }
}
