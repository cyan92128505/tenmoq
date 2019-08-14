import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:tenmoq/redux/app/state.dart';
import 'package:tenmoq/redux/setting/state.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
