import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_ulearna/data/model/video_data_hive.dart';
import 'package:interview_ulearna/presentation/video_screen/bloc/video_bloc.dart';

import '../../data/local_data_source/video_local_data_source.dart';
import '../../data/remote_data_source/post_remote_data_source.dart';
import '../../data/repository/post_repository_impl.dart';
import '../../domain/repository/post_repository.dart';
import '../../domain/usecase/get_posts_use_case.dart';
import '../video_widget/bloc/video_player_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External
  final dio = Dio();
  getIt.registerLazySingleton(() => dio);

  await Hive.initFlutter();
  Hive.registerAdapter(VideoDataHiveAdapter());
  final cacheBox = await Hive.openBox<List<dynamic>>('post_cache_ulearna1');
  getIt.registerLazySingleton(() => cacheBox);

  // Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<VideoLocalDataSource>(
      () => VideoLocalDataSourceImpl(cacheBox: getIt()));

  // Repositories
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
        remoteDataSource: getIt(), cacheBox: getIt(), localDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));

  // Bloc
  getIt.registerFactory(() => VideoBloc(getIt()));
  getIt.registerFactory(() => VideoPlayerBloc());
}
