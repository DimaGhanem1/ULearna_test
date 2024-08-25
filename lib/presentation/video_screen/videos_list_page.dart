import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ulearna/presentation/video_widget/video_player_widget.dart';

import '../../generated/l10n.dart';
import '../di/service_locater.dart';
import 'bloc/video_bloc.dart';

class VideosListPage extends StatefulWidget {
  @override
  _VideosListPageState createState() => _VideosListPageState();
}

class _VideosListPageState extends State<VideosListPage> {
  late VideoBloc _postBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _postBloc = getIt<VideoBloc>();
    _postBloc.fetchNextPage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _postBloc.fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).videos),
      ),
      body: BlocBuilder<VideoBloc, VideoState>(
        bloc: _postBloc,
        builder: (context, state) {
          if (state is VideoLoading && _postBloc.page == 2) {
            return Center(child: CircularProgressIndicator());
          } else if (state is VideoError) {
            return Center(child: Text(state.message));
          } else if (state is VideoLoaded) {
            //lazy loading widget
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              controller: _scrollController,
              itemCount: state.posts.length + 1,
              itemBuilder: (context, index) {
                if (index == state.posts.length) {
                  return Center(child: CircularProgressIndicator());
                }
                final video = state.posts[index];
                return Container(
                    height: 300,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // color: Colors.blue, // Background color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: VideoPlayerWidget(
                            url: video.cdnUrl,
                          ),
                        ),
                        Text(
                          video.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
