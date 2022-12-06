part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmited extends LoginEvent {
  final int id;
  final String password;

  LoginSubmited(this.id, this.password);

  @override
  List<Object> get props => [id, password];
}
