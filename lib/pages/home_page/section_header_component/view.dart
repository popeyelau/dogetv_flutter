import 'package:dogetv_flutter/pages/home_page/section_header_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_right,
          ),
          onPressed: () => dispatch(SectionHeaderActionCreator.onShowMore()),
        )
      ],
    ),
  );
}
