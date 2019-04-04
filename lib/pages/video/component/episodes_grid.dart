import 'package:dogetv_flutter/pages/player/page.dart';
import 'package:dogetv_flutter/repository/movie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/models/episode.dart';

class EpisodesGridComponent extends Component<List<Episode>> {
  EpisodesGridComponent() : super(view: buildView, effect: buildEffect());
}

Widget buildView(List<Episode> state, dispatch, ViewService viewService) {
  return GridView.builder(
    padding: EdgeInsets.all(8.0),
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: state.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.5,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0),
    itemBuilder: (BuildContext context, int index) {
      final episode = state[index];
      return GestureDetector(
        onTap: () => dispatch(EpisodeItemActionCreator.onPlay(episode, state)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: Colors.white24,
                width: 0.5,
              )),
          child: Center(
            child: Text(
              episode.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}

enum EpisodeItemAction { onPlay }

class EpisodeItemActionCreator {
  static Action onPlay(Episode episode, List<Episode> episodes) {
    Map<String, dynamic> payload = {"episode": episode, "episodes": episodes};
    return Action(EpisodeItemAction.onPlay, payload: payload);
  }
}

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
