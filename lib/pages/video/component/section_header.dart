import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class VideoSectionHeaderComponent extends Component<String> {
  VideoSectionHeaderComponent() : super(view: buildView);
}

Widget buildView(String state, dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    child: Row(
      children: <Widget>[
        Container(
          width: 2,
          height: 20,
          color: Colors.white,
          margin: EdgeInsets.only(right: 10),
        ),
        Expanded(
          child: Text(
            state,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}
