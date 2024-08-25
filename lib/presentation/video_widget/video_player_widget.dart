import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ulearna/presentation/di/service_locater.dart';
import 'package:interview_ulearna/presentation/video_widget/bloc/video_player_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        VideoPlayerBloc bloc = getIt<VideoPlayerBloc>();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          bloc.add(LoadVideo(url: widget.url));
        });
        return bloc;
      },
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, state) {
          if (state is VideoPlayerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is VideoPlayerLoaded) {
            bool isPlaying = state.controller.value.isPlaying;
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AspectRatio(
                  aspectRatio: state.controller.value.aspectRatio,
                  child: VideoPlayer(state.controller),
                ),
                InkWell(
                  onTap: () {
                    context.read<VideoPlayerBloc>().add(PlayPauseVideo());
                  },
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          } else if (state is VideoPlayerError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
