import 'package:redux/redux.dart';
import 'state.dart';
import 'actions.dart';

final Reducer<ValueTreeState> valueTreeStateReducer =
    combineReducers<ValueTreeState>(
  [
    TypedReducer<ValueTreeState, UpdateValueTree>(_updateValueTree),
  ],
);

ValueTreeState _updateValueTree(
  ValueTreeState state,
  UpdateValueTree action,
) {
  Map<String, dynamic> _map = state.tree;
  _map[action.target] = action.value;
  return state.rebuild((b) => b..tree = _map);
}
