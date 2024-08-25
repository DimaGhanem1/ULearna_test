// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: (json['data'] as List<dynamic>)
          .map((e) => VideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

VideoData _$VideoDataFromJson(Map<String, dynamic> json) => VideoData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      cdnUrl: json['cdn_url'] as String,
      thumbCdnUrl: json['thumb_cdn_url'] as String,
      userId: (json['userId'] as num?)?.toInt(),
      status: json['status'] as String?,
      slug: json['slug'] as String?,
      encodeStatus: json['encodeStatus'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      totalViews: (json['totalViews'] as num?)?.toInt(),
      totalLikes: (json['totalLikes'] as num?)?.toInt(),
      totalComments: (json['totalComments'] as num?)?.toInt(),
      totalShare: (json['totalShare'] as num?)?.toInt(),
      totalWishlist: (json['totalWishlist'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      byteAddedOn: json['byteAddedOn'] == null
          ? null
          : DateTime.parse(json['byteAddedOn'] as String),
      byteUpdatedOn: json['byteUpdatedOn'] == null
          ? null
          : DateTime.parse(json['byteUpdatedOn'] as String),
      bunnyStreamVideoId: json['bunnyStreamVideoId'] as String?,
      language: json['language'] as String?,
      bunnyEncodingStatus: (json['bunnyEncodingStatus'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      user: json['user'] == null
          ? null
          : UserJson.fromJson(json['user'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool?,
      isWished: json['isWished'] as bool?,
      isFollow: json['isFollow'] as bool?,
    );

Map<String, dynamic> _$VideoDataToJson(VideoData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'cdn_url': instance.cdnUrl,
      'thumb_cdn_url': instance.thumbCdnUrl,
      'userId': instance.userId,
      'status': instance.status,
      'slug': instance.slug,
      'encodeStatus': instance.encodeStatus,
      'priority': instance.priority,
      'categoryId': instance.categoryId,
      'totalViews': instance.totalViews,
      'totalLikes': instance.totalLikes,
      'totalComments': instance.totalComments,
      'totalShare': instance.totalShare,
      'totalWishlist': instance.totalWishlist,
      'duration': instance.duration,
      'byteAddedOn': instance.byteAddedOn?.toIso8601String(),
      'byteUpdatedOn': instance.byteUpdatedOn?.toIso8601String(),
      'bunnyStreamVideoId': instance.bunnyStreamVideoId,
      'language': instance.language,
      'bunnyEncodingStatus': instance.bunnyEncodingStatus,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'user': instance.user?.toJson(),
      'isLiked': instance.isLiked,
      'isWished': instance.isWished,
      'isFollow': instance.isFollow,
    };

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => UserJson(
      userId: (json['userId'] as num?)?.toInt(),
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profilePicture'] as String?,
      profilePictureCdn: json['profilePictureCdn'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$UserJsonToJson(UserJson instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
      'profilePictureCdn': instance.profilePictureCdn,
      'designation': instance.designation,
    };
