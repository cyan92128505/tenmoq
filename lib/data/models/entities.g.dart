// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorEntity> _$errorEntitySerializer = new _$ErrorEntitySerializer();
Serializer<ResponseBody> _$responseBodySerializer =
    new _$ResponseBodySerializer();

class _$ErrorEntitySerializer implements StructuredSerializer<ErrorEntity> {
  @override
  final Iterable<Type> types = const [ErrorEntity, _$ErrorEntity];
  @override
  final String wireName = 'ErrorEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ErrorEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
      'Message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ErrorEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseBodySerializer implements StructuredSerializer<ResponseBody> {
  @override
  final Iterable<Type> types = const [ResponseBody, _$ResponseBody];
  @override
  final String wireName = 'ResponseBody';

  @override
  Iterable<Object> serialize(Serializers serializers, ResponseBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'Error',
      serializers.serialize(object.error,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ErrorEntity)])),
      'Code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'ReplyTime',
      serializers.serialize(object.replyTime,
          specifiedType: const FullType(int)),
    ];
    if (object.result != null) {
      result
        ..add('Result')
        ..add(serializers.serialize(object.result, specifiedType: parameterT));
    }
    return result;
  }

  @override
  ResponseBody deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ResponseBodyBuilder<Object>()
        : serializers.newBuilder(specifiedType) as ResponseBodyBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Error':
          result.error.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ErrorEntity)]))
              as BuiltList<dynamic>);
          break;
        case 'Code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Result':
          result.result =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'ReplyTime':
          result.replyTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorEntity extends ErrorEntity {
  @override
  final String field;
  @override
  final String message;

  factory _$ErrorEntity([void Function(ErrorEntityBuilder) updates]) =>
      (new ErrorEntityBuilder()..update(updates)).build();

  _$ErrorEntity._({this.field, this.message}) : super._() {
    if (field == null) {
      throw new BuiltValueNullFieldError('ErrorEntity', 'field');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ErrorEntity', 'message');
    }
  }

  @override
  ErrorEntity rebuild(void Function(ErrorEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorEntityBuilder toBuilder() => new ErrorEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorEntity &&
        field == other.field &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, field.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorEntity')
          ..add('field', field)
          ..add('message', message))
        .toString();
  }
}

class ErrorEntityBuilder implements Builder<ErrorEntity, ErrorEntityBuilder> {
  _$ErrorEntity _$v;

  String _field;
  String get field => _$this._field;
  set field(String field) => _$this._field = field;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ErrorEntityBuilder();

  ErrorEntityBuilder get _$this {
    if (_$v != null) {
      _field = _$v.field;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorEntity;
  }

  @override
  void update(void Function(ErrorEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorEntity build() {
    final _$result = _$v ?? new _$ErrorEntity._(field: field, message: message);
    replace(_$result);
    return _$result;
  }
}

class _$ResponseBody<T> extends ResponseBody<T> {
  @override
  final BuiltList<ErrorEntity> error;
  @override
  final int code;
  @override
  final T result;
  @override
  final int replyTime;

  factory _$ResponseBody([void Function(ResponseBodyBuilder<T>) updates]) =>
      (new ResponseBodyBuilder<T>()..update(updates)).build();

  _$ResponseBody._({this.error, this.code, this.result, this.replyTime})
      : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('ResponseBody', 'error');
    }
    if (code == null) {
      throw new BuiltValueNullFieldError('ResponseBody', 'code');
    }
    if (replyTime == null) {
      throw new BuiltValueNullFieldError('ResponseBody', 'replyTime');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('ResponseBody', 'T');
    }
  }

  @override
  ResponseBody<T> rebuild(void Function(ResponseBodyBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBodyBuilder<T> toBuilder() =>
      new ResponseBodyBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseBody &&
        error == other.error &&
        code == other.code &&
        result == other.result &&
        replyTime == other.replyTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), code.hashCode), result.hashCode),
        replyTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResponseBody')
          ..add('error', error)
          ..add('code', code)
          ..add('result', result)
          ..add('replyTime', replyTime))
        .toString();
  }
}

class ResponseBodyBuilder<T>
    implements Builder<ResponseBody<T>, ResponseBodyBuilder<T>> {
  _$ResponseBody<T> _$v;

  ListBuilder<ErrorEntity> _error;
  ListBuilder<ErrorEntity> get error =>
      _$this._error ??= new ListBuilder<ErrorEntity>();
  set error(ListBuilder<ErrorEntity> error) => _$this._error = error;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  T _result;
  T get result => _$this._result;
  set result(T result) => _$this._result = result;

  int _replyTime;
  int get replyTime => _$this._replyTime;
  set replyTime(int replyTime) => _$this._replyTime = replyTime;

  ResponseBodyBuilder();

  ResponseBodyBuilder<T> get _$this {
    if (_$v != null) {
      _error = _$v.error?.toBuilder();
      _code = _$v.code;
      _result = _$v.result;
      _replyTime = _$v.replyTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseBody<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResponseBody<T>;
  }

  @override
  void update(void Function(ResponseBodyBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResponseBody<T> build() {
    _$ResponseBody<T> _$result;
    try {
      _$result = _$v ??
          new _$ResponseBody<T>._(
              error: error.build(),
              code: code,
              result: result,
              replyTime: replyTime);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'error';
        error.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
