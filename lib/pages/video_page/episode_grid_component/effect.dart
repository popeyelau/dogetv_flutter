import 'package:dogetv_flutter/models/episode.dart';
import 'package:dogetv_flutter/pages/player_page/page.dart';
import 'package:dogetv_flutter/pages/video_page/episode_grid_component/action.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    EpisodeItemAction.onPlay: onPlay,
  });
}

onPlay(Action action, Context ctx) async {
  Episode episode = action.payload["episode"];
  List<Episode> episodes = action.payload["episodes"];
  String sourceURL = episode.url;
  Map<String, dynamic> payload = {"url": episode.url, "episodes": episodes};
  if (sourceURL.endsWith(".m3u8")) {
    Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
      return PlayerPage().buildPage(payload);
    }));
    return;
  }

  String streamURL = await APIs.getStreamURL(sourceURL);
  if (streamURL == null) {
    return;
  }
  payload["url"] = streamURL;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return PlayerPage().buildPage(payload);
  }));
}
