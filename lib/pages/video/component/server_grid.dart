import 'package:dogetv_flutter/pages/video/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class VideoServerGridComponent extends Component<List<int>> {
  VideoServerGridComponent() : super(view: buildView);
}

Widget buildView(List<int> state, dispatch, ViewService viewService) {
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
      final source = state[index];
      return GestureDetector(
        onTap: () => dispatch(
            VideoPageActionCreator.onUpdateSourceAction(source.toString())),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: Colors.white24,
                width: 0.5,
              )),
          child: Center(
            child: Text(
              source == 0 ? "默认线路" : "线路$source",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}

/*
enum ServerItemAction { onUpdateServer, didUpdateServer }

class ServerItemActionCreator {
  static Action onUpdateServer(String source) {
    return Action(ServerItemAction.onUpdateServer, payload: source);
  }

  static Action didUpdateServer(String source, List<Episode> episodes) {
    Map<String, dynamic> payload = {"episodes": episodes, "source": source};
    return Action(ServerItemAction.didUpdateServer, payload: payload);
  }
}

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    ServerItemAction.onUpdateServer: onUpdateServer,
  });
}

onUpdateServer(Action action, Context ctx) async {
  String source = action.payload["source"];
  String videoId = action.payload["videoId"];
  List<Episode> episodes = await APIs.getEpisodes(videoId, source);
  ctx.dispatch(ServerItemActionCreator.didUpdateServer(source, episodes));
}*/
