import 'package:dio/dio.dart';
import '../model/api_response.dart';

abstract class PostRemoteDataSource {
  Future<List<VideoData>> fetchPosts(int page);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<VideoData>> fetchPosts(int page) async {
    //
    final response = await dio.get(
        'https://api.ulearna.com/bytes/all?page=$page&limit=10&country=United%20States');
    if (response.statusCode == 200) {
      ApiResponse responseData = ApiResponse.fromJson(response.data);
      return responseData.data.data;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
