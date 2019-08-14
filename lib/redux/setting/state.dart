import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class SettingState
    implements Built<SettingState, SettingStateBuilder> {
  factory SettingState() {
    return _$SettingState._(
      version: '1.0.0',
    );
  }

  SettingState._();

  String get version;

  static Serializer<SettingState> get serializer => _$settingStateSerializer;
}
