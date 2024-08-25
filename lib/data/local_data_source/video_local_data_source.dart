import 'package:hive/hive.dart';
import 'package:interview_ulearna/data/model/video_data_hive.dart';

import '../model/api_response.dart';

abstract class VideoLocalDataSource {
  Future<List<VideoData>> getCachedVideos(int page);
  Future<void> cacheVideos(int page, List<VideoData> videos);
}

class VideoLocalDataSourceImpl extends VideoLocalDataSource {
  final Box<List<dynamic>> cacheBox;

  VideoLocalDataSourceImpl({required this.cacheBox});

  @override
  Future<List<VideoData>> getCachedVideos(int page) async {
    final cacheKey = 'video_page_$page';

    if (cacheBox.containsKey(cacheKey)) {
      final hiveVideos = cacheBox.get(cacheKey) ?? [];

      return hiveVideos
          .map((videoHive) => VideoData(
                id: videoHive.id,
                title: videoHive.title,
                url: videoHive.url,
                cdnUrl: videoHive.cdnUrl,
                thumbCdnUrl: videoHive.thumbCdnUrl,
                userId: videoHive.userId,
                status: videoHive.status,
                slug: videoHive.slug,
                encodeStatus: videoHive.encodeStatus,
                priority: videoHive.priority,
                categoryId: videoHive.categoryId,
                totalViews: videoHive.totalViews,
                totalLikes: videoHive.totalLikes,
                totalComments: videoHive.totalComments,
                totalShare: videoHive.totalShare,
                totalWishlist: videoHive.totalWishlist,
                duration: videoHive.duration,
                byteAddedOn: videoHive.byteAddedOn,
                byteUpdatedOn: videoHive.byteUpdatedOn,
                bunnyStreamVideoId: videoHive.bunnyStreamVideoId,
                language: videoHive.language,
                bunnyEncodingStatus: videoHive.bunnyEncodingStatus,
                user: null, // Handle user accordingly
                isLiked: videoHive.isLiked,
                isWished: videoHive.isWished,
                isFollow: videoHive.isFollow,
              ))
          .toList();
    }
    return [];
  }

  @override
  Future<void> cacheVideos(int page, List<VideoData> videos) async {
    final cacheKey = 'video_page_$page';
    List<VideoDataHive> hiveVideos = videos
        .map((videoData) => VideoDataHive(
              id: videoData.id ?? 0,
              title: videoData.title ?? '',
              url: videoData.url ?? '',
              cdnUrl: videoData.cdnUrl,
              thumbCdnUrl: videoData.thumbCdnUrl,
              userId: videoData.userId ?? 0,
              status: videoData.status ?? '',
              slug: videoData.slug ?? '',
              encodeStatus: videoData.encodeStatus ?? '',
              priority: videoData.priority ?? 0,
              categoryId: videoData.categoryId ?? 0,
              totalViews: videoData.totalViews ?? 0,
              totalLikes: videoData.totalLikes ?? 0,
              totalComments: videoData.totalComments ?? 0,
              totalShare: videoData.totalShare ?? 0,
              totalWishlist: videoData.totalWishlist ?? 0,
              duration: videoData.duration ?? 0,
              byteAddedOn: videoData.byteAddedOn ?? DateTime.now(),
              byteUpdatedOn: videoData.byteUpdatedOn ?? DateTime.now(),
              bunnyStreamVideoId: videoData.bunnyStreamVideoId ?? '',
              language: videoData.language,
              bunnyEncodingStatus: videoData.bunnyEncodingStatus ?? 0,
              isLiked: videoData.isLiked ?? false,
              isWished: videoData.isWished ?? false,
              isFollow: videoData.isFollow ?? false,
            ))
        .toList();

    try {
      await cacheBox.put(cacheKey, hiveVideos);
    } catch (e) {
      print('Failed to store data: $e');
    }
  }
}
