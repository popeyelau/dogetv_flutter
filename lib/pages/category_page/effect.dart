import 'package:dogetv_flutter/pages/category_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<CategoryPageState> buildEffect() {
  return combineEffects(<Object, Effect<CategoryPageState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<CategoryPageState> ctx) async {}
