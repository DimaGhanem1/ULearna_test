import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_ulearna/data/model/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/get_posts_use_case.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetPostsUseCase getPostsUseCase;

  int page = 1;
  bool isFetching = false;

  VideoBloc(this.getPostsUseCase) : super(VideosInitial()) {
    on<FetchVideosEvent>((event, emit) async {
      if (isFetching) return;
      isFetching = true;

      try {
        emit(VideoLoading());
        final posts = await getPostsUseCase.call(event.page);
        emit(VideoLoaded(posts));
        isFetching = false;
      } catch (e) {
        emit(VideoError(e.toString()));
        isFetching = false;
      }
    });
  }

  void fetchNextPage() {
    add(FetchVideosEvent(page));
    page++;
  }
}
