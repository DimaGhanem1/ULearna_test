import '../../data/model/api_response.dart';

abstract class PostRepository {
  Future<List<VideoData>> getVideos(int page);
}
