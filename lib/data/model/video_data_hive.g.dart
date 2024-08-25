// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_data_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoDataHiveAdapter extends TypeAdapter<VideoDataHive> {
  @override
  final int typeId = 0;

  @override
  VideoDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoDataHive(
      id: fields[0] as int,
      title: fields[1] as String,
      url: fields[2] as String,
      cdnUrl: fields[3] as String,
      thumbCdnUrl: fields[4] as String,
      userId: fields[5] as int,
      status: fields[6] as String,
      slug: fields[7] as String,
      encodeStatus: fields[8] as String,
      priority: fields[9] as int,
      categoryId: fields[10] as int,
      totalViews: fields[11] as int,
      totalLikes: fields[12] as int,
      totalComments: fields[13] as int,
      totalShare: fields[14] as int,
      totalWishlist: fields[15] as int,
      duration: fields[16] as int,
      byteAddedOn: fields[17] as DateTime,
      byteUpdatedOn: fields[18] as DateTime,
      bunnyStreamVideoId: fields[19] as String,
      language: fields[20] as String?,
      bunnyEncodingStatus: fields[21] as int,
      deletedAt: fields[22] as DateTime?,
      isLiked: fields[24] as bool,
      isWished: fields[25] as bool,
      isFollow: fields[26] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, VideoDataHive obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.cdnUrl)
      ..writeByte(4)
      ..write(obj.thumbCdnUrl)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.slug)
      ..writeByte(8)
      ..write(obj.encodeStatus)
      ..writeByte(9)
      ..write(obj.priority)
      ..writeByte(10)
      ..write(obj.categoryId)
      ..writeByte(11)
      ..write(obj.totalViews)
      ..writeByte(12)
      ..write(obj.totalLikes)
      ..writeByte(13)
      ..write(obj.totalComments)
      ..writeByte(14)
      ..write(obj.totalShare)
      ..writeByte(15)
      ..write(obj.totalWishlist)
      ..writeByte(16)
      ..write(obj.duration)
      ..writeByte(17)
      ..write(obj.byteAddedOn)
      ..writeByte(18)
      ..write(obj.byteUpdatedOn)
      ..writeByte(19)
      ..write(obj.bunnyStreamVideoId)
      ..writeByte(20)
      ..write(obj.language)
      ..writeByte(21)
      ..write(obj.bunnyEncodingStatus)
      ..writeByte(22)
      ..write(obj.deletedAt)
      ..writeByte(24)
      ..write(obj.isLiked)
      ..writeByte(25)
      ..write(obj.isWished)
      ..writeByte(26)
      ..write(obj.isFollow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserHiveAdapter extends TypeAdapter<UserHive> {
  @override
  final int typeId = 1;

  @override
  UserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHive(
      userId: fields[0] as int,
      fullname: fields[1] as String,
      username: fields[2] as String,
      profilePicture: fields[3] as String,
      profilePictureCdn: fields[4] as String,
      designation: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.profilePicture)
      ..writeByte(4)
      ..write(obj.profilePictureCdn)
      ..writeByte(5)
      ..write(obj.designation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
