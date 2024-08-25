import 'package:interview_ulearna/data/model/api_response.dart';

import '../repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<VideoData>> call(int page) async {
    return await repository.getVideos(page);
  }
}
