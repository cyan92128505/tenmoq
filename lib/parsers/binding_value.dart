import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

import 'package:tenmoq/redux/app/state.dart';

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

    return BindindValueWrapper(bindingTarget);
  }
}

class BindindValueWrapper extends StatelessWidget {
  final String bindingTarget;
  BindindValueWrapper(this.bindingTarget);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BindindValueVM>(
      converter: BindindValueVM.fromStore,
      builder: (BuildContext context, BindindValueVM viewModel) {
        return BindindValueView(viewModel, bindingTarget);
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
    return BindindValueVM(tree: store.state.valueTreeState.tree);
  }
}

class BindindValueView extends StatelessWidget {
  final BindindValueVM viewModel;
  final String bindingTarget;

  BindindValueView(this.viewModel, this.bindingTarget);

  @override
  Widget build(BuildContext context) {
    return Text(viewModel.tree[bindingTarget]);
  }
}
