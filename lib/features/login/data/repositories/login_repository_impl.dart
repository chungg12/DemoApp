import 'package:clean_architecture_tdd_course/features/login/data/datasources/login_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginModel>> postLogin(int id, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.postLogin(id, password);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
