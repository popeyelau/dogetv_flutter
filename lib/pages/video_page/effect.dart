import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/pages/video_page/action.dart';
import 'package:dogetv_flutter/pages/video_page/state.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';

Effect<VideoPageState> buildEffect() {
  return combineEffects(<Object, Effect<VideoPageState>>{
    Lifecycle.initState: _init,
    VideoPageAction.onFetch: _onFetch,
    VideoPageAction.onUpdateSource: _onUpdateSource
  });
}

void _init(Action action, Context<VideoPageState> ctx) async {}

void _onFetch(Action action, Context<VideoPageState> ctx) async {
  APIs.getVideo(ctx.state.videoId).then((videoDetail) {
    ctx.dispatch(VideoPageActionCreator.didLoadAction(videoDetail));
  });
}

void _onUpdateSource(Action action, Context<VideoPageState> ctx) async {
  String source = action.payload;
  APIs.getEpisodes(ctx.state.videoId, source).then((episodes) {
    if (episodes.isEmpty) {
      return;
    }
    ctx.dispatch(
        VideoPageActionCreator.didUpdateSourceAction(source, episodes));
  });
}
