import 'package:dogetv_flutter/models/query.dart';
import 'package:dogetv_flutter/pages/category_page/grid_item_component/action.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
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
                      padding: EdgeInsets.all(8),
                      child: Text(
                        option.text,
                        style: TextStyle(
                            color:
                                option.isSelected ? Colors.red : Colors.white),
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
