import 'package:get_it/get_it.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/layers/data/repositories/auth_repository_impl.dart';
import 'package:storyv2/layers/data/sources/auth_remote_source.dart';
import 'package:storyv2/layers/domain/repositories/auth_repository.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';
import 'package:storyv2/layers/presentation/auth/login/login_bloc.dart';
import 'package:storyv2/layers/presentation/auth/register/register_bloc.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';
import 'package:storyv2/utils/secure_storage.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  await _initSecureStorage();
  sl.registerSingleton<ApiClient>(ApiClient());
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

Future<void> _initSecureStorage() async {
  await SecureStorageMixin.initSecureStorage();
  sl.registerSingleton<SecureStorageMixin>(SecureStorageMixin());
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteSource: sl(), secureStorageMixin: sl()),
  );
}

void _dataSources() {
  sl.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
}

void _blocs() {
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
}
