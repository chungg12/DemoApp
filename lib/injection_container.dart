import 'package:clean_architecture_tdd_course/features/login/data/datasources/login_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/login/data/repositories/login_repository_impl.dart';
import 'package:clean_architecture_tdd_course/features/login/domain/repositories/login_repository.dart';
import 'package:clean_architecture_tdd_course/features/login/domain/usecases/post_login.dart';
import 'package:clean_architecture_tdd_course/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => LoginBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => PostLogin(sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
