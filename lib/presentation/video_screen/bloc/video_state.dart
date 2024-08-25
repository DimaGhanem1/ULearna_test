part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();
}

class VideosInitial extends VideoState {
  @override
  List<Object?> get props => [];
}

class VideoLoading extends VideoState {
  @override
  List<Object?> get props => [];
}

class VideoLoaded extends VideoState {
  final List<VideoData> posts;

  VideoLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);

  @override
  List<Object?> get props => [message];
}
