import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  final int? statusCode;
  final String? message;
  final Data data;

  ApiResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  final List<VideoData> data;

  Data({required this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideoData {
  final int? id;
  final String? title;
  final String? url;
  @JsonKey(name: 'cdn_url')
  final String cdnUrl;
  @JsonKey(name: 'thumb_cdn_url')
  final String thumbCdnUrl;
  final int? userId;
  final String? status;
  final String? slug;
  final String? encodeStatus;
  final int? priority;
  final int? categoryId;
  final int? totalViews;
  final int? totalLikes;
  final int? totalComments;
  final int? totalShare;
  final int? totalWishlist;
  final int? duration;
  final DateTime? byteAddedOn;
  final DateTime? byteUpdatedOn;
  final String? bunnyStreamVideoId;
  final String? language;
  final int? bunnyEncodingStatus;
  final DateTime? deletedAt;
  final UserJson? user;
  final bool? isLiked;
  final bool? isWished;
  final bool? isFollow;

  VideoData({
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
    required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) =>
      _$VideoDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDataToJson(this);
}

@JsonSerializable()
class UserJson {
  final int? userId;
  final String? fullname;
  final String? username;
  final String? profilePicture;
  final String? profilePictureCdn;
  final String? designation;

  UserJson({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });

  factory UserJson.fromJson(Map<String, dynamic> json) =>
      _$UserJsonFromJson(json);

  Map<String, dynamic> toJson() => _$UserJsonToJson(this);
}
