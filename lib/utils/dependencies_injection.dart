import 'package:get_it/get_it.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/presentation/blocs/internet_checker/internet_checker_bloc.dart';
import 'package:storyv2/layers/data/repositories/auth_repository_impl.dart';
import 'package:storyv2/layers/data/repositories/profile_repository_impl.dart';
import 'package:storyv2/layers/data/repositories/story_repository_impl.dart';
import 'package:storyv2/layers/data/sources/auth_remote_source.dart';
import 'package:storyv2/layers/data/sources/profile_source.dart';
import 'package:storyv2/layers/data/sources/story_source.dart';
import 'package:storyv2/layers/data/sources/tale_source.dart';
import 'package:storyv2/layers/domain/repositories/auth_repository.dart';
import 'package:storyv2/layers/domain/repositories/profile_repository.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';
import 'package:storyv2/layers/domain/repositories/tale_repository.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';
import 'package:storyv2/layers/domain/usecases/feed/get_for_me_story.dart';
import 'package:storyv2/layers/domain/usecases/feed/get_trending_story.dart';
import 'package:storyv2/layers/domain/usecases/profile/get_my_profile.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_direction.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_popular_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';
import 'package:storyv2/layers/presentation/auth/login/login_bloc.dart';
import 'package:storyv2/layers/presentation/auth/register/register_bloc.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/trending_story/trending_story_bloc.dart';
import 'package:storyv2/layers/presentation/me/bloc/profile_bloc/get_profile_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_direction/get_direction_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_tale_intro/get_tale_intro_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';
import 'package:storyv2/old/config/environment.config.dart';
import 'package:storyv2/utils/google_maps_service.dart';
import 'package:storyv2/utils/secure_storage.dart';

import '../layers/data/repositories/chat_repository_impl.dart';
import '../layers/data/repositories/tale_repository_impl.dart';
import '../layers/data/sources/chat_remote_source.dart';
import '../layers/data/sources/user_source.dart';
import '../layers/domain/repositories/chat_repository.dart';
import '../layers/domain/usecases/chat/check_or_create_profile.dart';
import '../layers/domain/usecases/chat/get_rooms.dart';
import '../layers/domain/usecases/chat/message_stream.dart';
import '../layers/domain/usecases/chat/read_message.dart';
import '../layers/domain/usecases/chat/send_message.dart';
import '../layers/domain/usecases/feed/get_categories.dart';
import '../layers/domain/usecases/feed/get_stories.dart';
import '../layers/presentation/chat/blocs/chat_rooms/chat_rooms_bloc.dart';
import '../layers/presentation/chat/blocs/read_message/read_message_bloc.dart';
import '../layers/presentation/chat/blocs/send_message/send_message_bloc.dart';
import '../layers/presentation/feed/blocs/get_categories/get_categories_bloc.dart';
import '../layers/presentation/feed/blocs/get_stories/get_stories_bloc.dart';
import '../layers/presentation/feed/blocs/search_stories/search_stories_bloc.dart';
import 'services/dotenv_service.dart';
import 'services/isar_service.dart';
import 'services/supabase_service.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  await _initDotEnv();
  sl.registerSingleton<EnvironmentConfig>(EnvironmentConfig());
  await _initSecureStorage();
  await _initSupabase();
  await _initIsar();
  sl.registerSingleton<ApiClient>(ApiClient());
  sl.registerSingleton<GoogleMapsService>(GoogleMapsService());
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

Future<void> _initSecureStorage() async {
  await SecureStorageMixin.initSecureStorage();
  sl.registerSingleton<SecureStorageMixin>(SecureStorageMixin());
}

Future<void> _initDotEnv() async {
  await EnvironmentService.init();
  sl.registerSingleton<EnvironmentService>(EnvironmentService());
}

Future<void> _initIsar() async {
  await IsarServiceMixin.init();
  sl.registerSingleton<IsarServiceMixin>(IsarServiceMixin());
}

Future<void> _initSupabase() async {
  await SupabaseService.init();
  sl.registerSingleton<SupabaseService>(SupabaseService());
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteSource: sl(), secureStorageMixin: sl()),
  );
  sl.registerLazySingleton<TaleRepository>(
    () => TaleRepositoryImpl(taleSource: sl(), mapsService: sl()),
  );
  sl.registerLazySingleton<StoryRepository>(
    () => StoryRepositoryImpl(storySource: sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileSource: sl(), secureStorageMixin: SecureStorageMixin()),
  );
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl()),
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
  sl.registerLazySingleton<ProfileSource>(
    () => ProfileSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChatRemoteSource>(
    () => ChatRemoteSourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<UserSource>(
    () => UserSourceImpl(sl(), sl(), sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => GetPopularTales(sl()));
  sl.registerLazySingleton(() => GetNearMeTales(sl()));
  sl.registerLazySingleton(() => SearchTales(sl()));
  sl.registerLazySingleton(() => GetForMeStory(sl()));
  sl.registerLazySingleton(() => GetTrendingStory(sl()));
  sl.registerLazySingleton(() => GetMyProfile(sl()));
  sl.registerLazySingleton(() => GetStories(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => GetRooms(sl()));
  sl.registerLazySingleton(() => CheckOrCreateProfile(sl()));
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => MessageStream(sl()));
  sl.registerLazySingleton(() => ReadMessage(sl()));
  sl.registerLazySingleton(() => GetDirection(sl()));
}

void _blocs() {
  sl.registerFactory(() => InternetCheckerBloc());
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(() => LoginBloc(sl(), sl(), sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => GetPopularTalesBloc(sl()));
  sl.registerFactory(() => GetNearMeTalesBloc(sl()));
  sl.registerFactory(() => SearchTalesBloc(sl()));
  sl.registerFactory(() => GetTaleIntroBloc());
  sl.registerFactory(() => ForYouStoryBloc(sl()));
  sl.registerFactory(() => TrendingStoryBloc(sl()));
  sl.registerFactory(() => GetProfileBloc(sl()));
  sl.registerFactory(() => GetStoriesBloc(sl()));
  sl.registerFactory(() => GetCategoriesBloc(sl()));
  sl.registerFactory(() => SearchStoriesBloc(sl()));
  sl.registerFactory(() => ChatRoomsBloc(sl()));
  sl.registerFactory(() => SendMessageBloc(sl()));
  sl.registerFactory(() => ReadMessageBloc(sl()));
  sl.registerFactory(() => GetDirectionBloc(sl()));
}
