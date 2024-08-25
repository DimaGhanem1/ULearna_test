import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<LoadVideo>(_onLoadVideo);
    on<PlayPauseVideo>(_onPlayPauseVideo);
  }

  Future<void> _onLoadVideo(
      LoadVideo event, Emitter<VideoPlayerState> emit) async {
    emit(VideoPlayerLoading());

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(event.url));
      await controller.initialize();
      emit(VideoPlayerLoaded(
          controller: controller, isPlaying: controller.value.isPlaying));
    } catch (e) {
      emit(VideoPlayerError(message: e.toString()));
    }
  }

  void _onPlayPauseVideo(PlayPauseVideo event, Emitter<VideoPlayerState> emit) {
    if (state is VideoPlayerLoaded) {
      final currentState = state as VideoPlayerLoaded;
      final controller = currentState.controller;

      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }

      emit(VideoPlayerLoaded(
          controller: controller, isPlaying: controller.value.isPlaying));
    }
  }

  @override
  Future<void> close() {
    if (state is VideoPlayerLoaded) {
      (state as VideoPlayerLoaded).controller.dispose();
    }
    return super.close();
  }
}
