import 'package:redux/redux.dart';
import 'state.dart';
import 'actions.dart';

final Reducer<ValueTreeState> settingStateReducer =
    combineReducers<ValueTreeState>(
  [
    TypedReducer<ValueTreeState, UpdateValueTree>(_updateValueTree),
  ],
);

ValueTreeState _updateValueTree(
    ValueTreeState valueTreeState, UpdateValueTree action) {
  Map<String, dynamic> _map = valueTreeState.tree;
  _map[action.target] = action.value;
  return valueTreeState.rebuild((b) => b..tree = _map);
}
