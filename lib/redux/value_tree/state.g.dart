// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ValueTreeState> _$valueTreeStateSerializer =
    new _$ValueTreeStateSerializer();

class _$ValueTreeStateSerializer
    implements StructuredSerializer<ValueTreeState> {
  @override
  final Iterable<Type> types = const [ValueTreeState, _$ValueTreeState];
  @override
  final String wireName = 'ValueTreeState';

  @override
  Iterable<Object> serialize(Serializers serializers, ValueTreeState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tree',
      serializers.serialize(object.tree,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  ValueTreeState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueTreeStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'tree':
          result.tree = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$ValueTreeState extends ValueTreeState {
  @override
  final Map<String, dynamic> tree;

  factory _$ValueTreeState([void Function(ValueTreeStateBuilder) updates]) =>
      (new ValueTreeStateBuilder()..update(updates)).build();

  _$ValueTreeState._({this.tree}) : super._() {
    if (tree == null) {
      throw new BuiltValueNullFieldError('ValueTreeState', 'tree');
    }
  }

  @override
  ValueTreeState rebuild(void Function(ValueTreeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueTreeStateBuilder toBuilder() =>
      new ValueTreeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueTreeState && tree == other.tree;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tree.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueTreeState')..add('tree', tree))
        .toString();
  }
}

class ValueTreeStateBuilder
    implements Builder<ValueTreeState, ValueTreeStateBuilder> {
  _$ValueTreeState _$v;

  Map<String, dynamic> _tree;
  Map<String, dynamic> get tree => _$this._tree;
  set tree(Map<String, dynamic> tree) => _$this._tree = tree;

  ValueTreeStateBuilder();

  ValueTreeStateBuilder get _$this {
    if (_$v != null) {
      _tree = _$v.tree;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueTreeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueTreeState;
  }

  @override
  void update(void Function(ValueTreeStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueTreeState build() {
    final _$result = _$v ?? new _$ValueTreeState._(tree: tree);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
