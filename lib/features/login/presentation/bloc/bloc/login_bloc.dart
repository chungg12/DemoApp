import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/features/login/domain/usecases/post_login.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin postLogin;
  LoginBloc(this.postLogin) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
  }
  Future<void> login(LoginSubmited event, Emitter<LoginState> emit,
      Either<Failure, LoginModel> eitherLogin) async {
    emit(Loading());
    final either = await postLogin.call(ParamLogin(event.id, event.password));
    await either.fold(
      (failure) async {
        emit(
          LoginError('', ''),
        );
      },
      (loginModel) async {
        emit(
          LoginSuccessful(loginModel),
        );
      },
    );
  }
}
