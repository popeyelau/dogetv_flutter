import 'package:fish_redux/fish_redux.dart';

enum SectionHeaderAction { onShowMore }

class SectionHeaderActionCreator {
  static Action onShowMore() {
    return Action(SectionHeaderAction.onShowMore);
  }
}
