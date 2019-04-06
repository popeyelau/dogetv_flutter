import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/action.dart';
import 'package:dogetv_flutter/pages/category_page/query_component/state.dart';
import 'package:dogetv_flutter/pages/category_page/tab_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

List<Widget> buildQuerySet(QueryPanelState state, dynamic dispatch) {
  if (state.optionSets == null) {
    return [];
  }
  return state.optionSets.map((querySet) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("${querySet.title}: ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                QueryOption option = querySet.options[index];
                return GestureDetector(
                  onTap: () {
                    dispatch(QueryPanelActionCreator.onSelected(
                        type: querySet.title, index: index));
                    dispatch(CategoryTabPageActionCreator.onUpdateQuery());
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        option.text,
                        style: option.isSelected
                            ? TextStyle(
                                color: Theme.of(context).accentColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500)
                            : TextStyle(
                                color: Theme.of(context).textTheme.title.color),
                      )),
                );
              },
              itemCount: querySet.options.length,
            ),
          ),
        ],
      ),
    );
  }).toList();
}

Widget buildView(QueryPanelState state, dispatch, ViewService viewService) {
  return SliverFixedExtentList(
    delegate: SliverChildListDelegate(buildQuerySet(state, dispatch)),
    itemExtent: 40,
  );
}
