import 'state.dart';

import 'package:tenmoq/redux/setting/reducer.dart';
import 'package:tenmoq/redux/value_tree/reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return state.rebuild((b) => b
    ..settingState.replace(settingStateReducer(state.settingState, action))
    ..valueTreeState
        .replace(valueTreeStateReducer(state.valueTreeState, action)));
}
