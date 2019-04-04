import 'package:dogetv_flutter/pages/home_page/section_header_component/effect.dart';
import 'package:dogetv_flutter/pages/home_page/section_header_component/view.dart';
import 'package:fish_redux/fish_redux.dart';

class SectionHeaderComponent extends Component<String> {
  SectionHeaderComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
        );
}
