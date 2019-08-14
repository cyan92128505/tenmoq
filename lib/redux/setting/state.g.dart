// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SettingState> _$settingStateSerializer =
    new _$SettingStateSerializer();

class _$SettingStateSerializer implements StructuredSerializer<SettingState> {
  @override
  final Iterable<Type> types = const [SettingState, _$SettingState];
  @override
  final String wireName = 'SettingState';

  @override
  Iterable<Object> serialize(Serializers serializers, SettingState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SettingState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SettingState extends SettingState {
  @override
  final String version;

  factory _$SettingState([void Function(SettingStateBuilder) updates]) =>
      (new SettingStateBuilder()..update(updates)).build();

  _$SettingState._({this.version}) : super._() {
    if (version == null) {
      throw new BuiltValueNullFieldError('SettingState', 'version');
    }
  }

  @override
  SettingState rebuild(void Function(SettingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingStateBuilder toBuilder() => new SettingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingState && version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc(0, version.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingState')
          ..add('version', version))
        .toString();
  }
}

class SettingStateBuilder
    implements Builder<SettingState, SettingStateBuilder> {
  _$SettingState _$v;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  SettingStateBuilder();

  SettingStateBuilder get _$this {
    if (_$v != null) {
      _version = _$v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingState;
  }

  @override
  void update(void Function(SettingStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingState build() {
    final _$result = _$v ?? new _$SettingState._(version: version);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
