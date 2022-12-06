import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int id;
  final String password;

  Login(this.id, this.password);

  @override
  List<Object> get props => [id, password];
}
