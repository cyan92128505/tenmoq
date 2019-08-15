import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

import 'package:tenmoq/redux/app/state.dart';
import 'index.dart';

class BindingValueParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return 'BindingValue' == widgetName;
  }

  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener listener,
  ) {
    String bindingTarget =
        map.containsKey('binding_target') ? map['binding_target'] : '';

    Map<String, dynamic> childMap = map['child'];

    return BindindValueWrapper(bindingTarget, childMap);
  }
}

class BindindValueWrapper extends StatelessWidget {
  final String bindingTarget;
  final Map<String, dynamic> childMap;
  BindindValueWrapper(this.bindingTarget, this.childMap);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BindindValueVM>(
      converter: BindindValueVM.fromStore,
      builder: (BuildContext context, BindindValueVM viewModel) {
        return BindindValueView(
          viewModel,
          bindingTarget,
          childMap,
        );
      },
    );
  }
}

class BindindValueVM {
  final Map<String, dynamic> tree;
  BindindValueVM({
    @required this.tree,
  });
  static BindindValueVM fromStore(Store<AppState> store) {
    return BindindValueVM(
      tree: store.state.valueTreeState.tree,
    );
  }
}

class BindindValueView extends StatelessWidget {
  final BindindValueVM viewModel;
  final String bindingTarget;
  final Map<String, dynamic> childMap;

  BindindValueView(this.viewModel, this.bindingTarget, this.childMap);

  @override
  Widget build(BuildContext context) {
    childMap['data'] = viewModel.tree[bindingTarget];
    return DynamicWidgetBuilder.buildFromMap(
        childMap, context, DefaultClickListener());
  }
}
