import 'package:clean_architecture_tdd_course/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';

class PostLogin implements UseCase<Login, ParamLogin> {
  final LoginRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, LoginModel>> call(ParamLogin params) async {
    return await repository.postLogin(params.id, params.password);
  }
}

class ParamLogin extends Equatable {
  final int id;
  final String password;
  ParamLogin(this.id, this.password);

  @override
  List<Object> get props => [id, password];
}
