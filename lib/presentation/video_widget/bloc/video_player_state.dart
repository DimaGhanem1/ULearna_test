part of 'video_player_bloc.dart';

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();

  @override
  List<Object?> get props => [];
}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {}

class VideoPlayerLoaded extends VideoPlayerState {
  final VideoPlayerController controller;
  final bool isPlaying;
  const VideoPlayerLoaded({
    required this.controller,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [controller, isPlaying];
}

class VideoPlayerError extends VideoPlayerState {
  final String message;

  const VideoPlayerError({required this.message});

  @override
  List<Object?> get props => [message];
}
