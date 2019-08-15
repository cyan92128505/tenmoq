import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tenmoq/redux/setting/state.dart';
import 'package:tenmoq/redux/value_tree/state.dart';

part 'state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState._(
      isLoading: false,
      settingState: SettingState(),
      valueTreeState: ValueTreeState(),
    );
  }

  AppState._();

  bool get isLoading;

  SettingState get settingState;
  ValueTreeState get valueTreeState;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
