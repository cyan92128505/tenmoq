// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'settingState',
      serializers.serialize(object.settingState,
          specifiedType: const FullType(SettingState)),
      'valueTreeState',
      serializers.serialize(object.valueTreeState,
          specifiedType: const FullType(ValueTreeState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'settingState':
          result.settingState.replace(serializers.deserialize(value,
              specifiedType: const FullType(SettingState)) as SettingState);
          break;
        case 'valueTreeState':
          result.valueTreeState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ValueTreeState)) as ValueTreeState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final SettingState settingState;
  @override
  final ValueTreeState valueTreeState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.isLoading, this.settingState, this.valueTreeState})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (settingState == null) {
      throw new BuiltValueNullFieldError('AppState', 'settingState');
    }
    if (valueTreeState == null) {
      throw new BuiltValueNullFieldError('AppState', 'valueTreeState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        isLoading == other.isLoading &&
        settingState == other.settingState &&
        valueTreeState == other.valueTreeState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), settingState.hashCode),
        valueTreeState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('settingState', settingState)
          ..add('valueTreeState', valueTreeState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SettingStateBuilder _settingState;
  SettingStateBuilder get settingState =>
      _$this._settingState ??= new SettingStateBuilder();
  set settingState(SettingStateBuilder settingState) =>
      _$this._settingState = settingState;

  ValueTreeStateBuilder _valueTreeState;
  ValueTreeStateBuilder get valueTreeState =>
      _$this._valueTreeState ??= new ValueTreeStateBuilder();
  set valueTreeState(ValueTreeStateBuilder valueTreeState) =>
      _$this._valueTreeState = valueTreeState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _settingState = _$v.settingState?.toBuilder();
      _valueTreeState = _$v.valueTreeState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: isLoading,
              settingState: settingState.build(),
              valueTreeState: valueTreeState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settingState';
        settingState.build();
        _$failedField = 'valueTreeState';
        valueTreeState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
