import 'package:hive/hive.dart';
import 'package:interview_ulearna/data/local_data_source/video_local_data_source.dart';
import '../model/api_response.dart';
import '../../domain/repository/post_repository.dart';
import '../remote_data_source/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final VideoLocalDataSource localDataSource;
  final Box<List<dynamic>> cacheBox;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheBox,
    required this.localDataSource,
  });

  @override
  Future<List<VideoData>> getVideos(int page) async {
    List<VideoData> posts = await localDataSource.getCachedVideos(page);

    if (posts.isNotEmpty) {
      return posts;
    }

    posts = await remoteDataSource.fetchPosts(page);
    await localDataSource.cacheVideos(page, posts);

    return posts;
  }
}
