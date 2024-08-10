import 'package:get_it/get_it.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/presentation/blocs/internet_checker/internet_checker_bloc.dart';
import 'package:storyv2/layers/data/repositories/auth_repository_impl.dart';
import 'package:storyv2/layers/data/repositories/story_repository_impl.dart';
import 'package:storyv2/layers/data/sources/auth_remote_source.dart';
import 'package:storyv2/layers/data/sources/story_source.dart';
import 'package:storyv2/layers/data/sources/tale_source.dart';
import 'package:storyv2/layers/domain/repositories/auth_repository.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';
import 'package:storyv2/layers/domain/repositories/tale_repository.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';
import 'package:storyv2/layers/domain/usecases/feed/get_for_me_story.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_popular_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';
import 'package:storyv2/layers/presentation/auth/login/login_bloc.dart';
import 'package:storyv2/layers/presentation/auth/register/register_bloc.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';
import 'package:storyv2/utils/secure_storage.dart';

import '../layers/data/repositories/tale_repository_impl.dart';

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
  sl.registerLazySingleton<TaleRepository>(
    () => TaleRepositoryImpl(taleSource: sl()),
  );
  sl.registerLazySingleton<StoryRepository>(
    () => StoryRepositoryImpl(storySource: sl()),
  );
}

void _dataSources() {
  sl.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(sl()),
  );
  sl.registerLazySingleton<TaleSource>(
    () => TaleSourceImpl(sl()),
  );
  sl.registerLazySingleton<StorySource>(
    () => StorySourceImpl(sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => GetPopularTales(sl()));
  sl.registerLazySingleton(() => GetNearMeTales(sl()));
  sl.registerLazySingleton(() => SearchTales(sl()));
  sl.registerLazySingleton(() => GetForMeStory(sl()));
}

void _blocs() {
  sl.registerFactory(() => InternetCheckerBloc());
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => GetPopularTalesBloc(sl()));
  sl.registerFactory(() => GetNearMeTalesBloc(sl()));
  sl.registerFactory(() => SearchTalesBloc(sl()));
  sl.registerFactory(() => ForYouStoryBloc(sl()));
}
