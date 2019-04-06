import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(
    Map<String, dynamic> state, dispatch, ViewService viewService) {
  final String title = state["title"];
  final String subTitle = state["subTitle"] ?? "";
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
            title,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
        Visibility(
          visible: subTitle.isNotEmpty,
          child: Text(subTitle),
        )
      ],
    ),
  );
}
