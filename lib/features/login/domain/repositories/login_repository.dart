import 'package:clean_architecture_tdd_course/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> postLogin(int id, String password);
}
