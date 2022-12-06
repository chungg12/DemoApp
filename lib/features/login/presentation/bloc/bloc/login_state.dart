part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Empty extends LoginState {}

class Loading extends LoginState {}

class LoginSuccessful extends LoginState {
  final LoginModel loginModel;

  LoginSuccessful(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class LoginError extends LoginState {
  final String msgCode;
  final String msgContent;

  LoginError(this.msgCode, this.msgContent);

  @override
  List<Object> get props => [msgCode, msgContent];
}
