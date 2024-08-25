import 'package:hive/hive.dart';

part 'video_data_hive.g.dart';

@HiveType(typeId: 0)
class VideoDataHive {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String url;

  @HiveField(3)
  final String cdnUrl;

  @HiveField(4)
  final String thumbCdnUrl;

  @HiveField(5)
  final int userId;

  @HiveField(6)
  final String status;

  @HiveField(7)
  final String slug;

  @HiveField(8)
  final String encodeStatus;

  @HiveField(9)
  final int priority;

  @HiveField(10)
  final int categoryId;

  @HiveField(11)
  final int totalViews;

  @HiveField(12)
  final int totalLikes;

  @HiveField(13)
  final int totalComments;

  @HiveField(14)
  final int totalShare;

  @HiveField(15)
  final int totalWishlist;

  @HiveField(16)
  final int duration;

  @HiveField(17)
  final DateTime byteAddedOn;

  @HiveField(18)
  final DateTime byteUpdatedOn;

  @HiveField(19)
  final String bunnyStreamVideoId;

  @HiveField(20)
  final String? language;

  @HiveField(21)
  final int bunnyEncodingStatus;

  @HiveField(22)
  final DateTime? deletedAt;

  // @HiveField(23)
  // final UserHive user;

  @HiveField(24)
  final bool isLiked;

  @HiveField(25)
  final bool isWished;

  @HiveField(26)
  final bool isFollow;

  VideoDataHive({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.bunnyStreamVideoId,
    required this.language,
    required this.bunnyEncodingStatus,
    this.deletedAt,
    // required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
  });
}

@HiveType(typeId: 1)
class UserHive {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String profilePicture;

  @HiveField(4)
  final String profilePictureCdn;

  @HiveField(5)
  final String designation;

  UserHive({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });
}
