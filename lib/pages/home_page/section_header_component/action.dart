import 'package:fish_redux/fish_redux.dart';

enum SectionHeaderAction { onShowMore }

class SectionHeaderActionCreator {
  static Action onShowMore(String type) {
    return Action(SectionHeaderAction.onShowMore, payload: type);
  }
}
