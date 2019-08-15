import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class ValueTreeState
    implements Built<ValueTreeState, ValueTreeStateBuilder> {
  factory ValueTreeState() {
    return _$ValueTreeState._(
      tree: {
        'demo': 'DEMO',
      },
    );
  }

  ValueTreeState._();

  Map<String, dynamic> get tree;

  static Serializer<ValueTreeState> get serializer =>
      _$valueTreeStateSerializer;
}
