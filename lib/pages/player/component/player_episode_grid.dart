import 'package:dogetv_flutter/pages/player/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/models/episode.dart';

class PlayerEpisodesGridComponent extends Component<List<Episode>> {
  PlayerEpisodesGridComponent() : super(view: buildView);
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
        onTap: () =>
            dispatch(PlayerPageActionCreator.onChangeEpisodeAction(episode)),
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
