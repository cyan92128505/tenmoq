import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:tenmoq/data/serializers.dart';
import 'package:tenmoq/utils/file_storage.dart';
import 'package:tenmoq/redux/setting/state.dart';

class PersistenceRepository {
  final FileStorage fileStorage;

  const PersistenceRepository({@required this.fileStorage});

  Future<File> saveSettingState(SettingState state) async {
    final data = serializers.serializeWith(SettingState.serializer, state);
    return await fileStorage.save(json.encode(data));
  }

  Future<SettingState> loadSettingState() async {
    final data = await fileStorage.load();

    return serializers.deserializeWith(
        SettingState.serializer, json.decode(data));
  }

  Future<FileSystemEntity> delete() async {
    return await fileStorage
        .exists()
        .then((exists) => exists ? fileStorage.delete() : null);
  }

  Future<bool> exists() async {
    return await fileStorage.exists();
  }
}
