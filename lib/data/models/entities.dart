import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'entities.g.dart';

abstract class ErrorEntity implements Built<ErrorEntity, ErrorEntityBuilder> {
  factory ErrorEntity([void updates(ErrorEntityBuilder b)]) = _$ErrorEntity;

  ErrorEntity._();

  @BuiltValueField(wireName: 'Field')
  String get field;
  @BuiltValueField(wireName: 'Message')
  String get message;

  static Serializer<ErrorEntity> get serializer => _$errorEntitySerializer;
}

abstract class ResponseBody<T>
    implements Built<ResponseBody<T>, ResponseBodyBuilder<T>> {
  factory ResponseBody([void updates(ResponseBodyBuilder<T> b)]) =
      _$ResponseBody<T>;

  ResponseBody._();

  @BuiltValueField(wireName: 'Error')
  BuiltList<ErrorEntity> get error;

  @BuiltValueField(wireName: 'Code')
  int get code;

  @BuiltValueField(wireName: 'Result')
  @nullable
  T get result;

  @BuiltValueField(wireName: 'ReplyTime')
  int get replyTime;

  static Serializer<ResponseBody> get serializer => _$responseBodySerializer;
}
