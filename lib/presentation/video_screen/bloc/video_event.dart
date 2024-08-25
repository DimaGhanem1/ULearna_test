part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchVideosEvent extends VideoEvent {
  final int page;

  FetchVideosEvent(this.page);

  @override
  List<Object?> get props => [page];
}
