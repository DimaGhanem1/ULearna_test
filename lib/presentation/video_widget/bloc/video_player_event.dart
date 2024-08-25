part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadVideo extends VideoPlayerEvent {
  final String url;

  const LoadVideo({required this.url});

  @override
  List<Object?> get props => [url];
}

class PlayPauseVideo extends VideoPlayerEvent {}
