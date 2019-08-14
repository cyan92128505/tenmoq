import 'package:redux/redux.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tenmoq/data/repositories/persistence_repository.dart';
import 'package:tenmoq/utils/file_storage.dart';

import 'actions.dart';
import 'state.dart';

List<Middleware<AppState>> createStorePersistenceMiddleware([
  PersistenceRepository settingRepository = const PersistenceRepository(
      fileStorage:
          const FileStorage('setting_state', getApplicationDocumentsDirectory)),
]) {
  final persistData = _createPersistData(settingRepository);
  return [
    TypedMiddleware<AppState, PersistData>(persistData),
  ];
}

Middleware<AppState> _createPersistData(
  PersistenceRepository settingRepository,
) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    final state = store.state;
    settingRepository.saveSettingState(state.settingState);
  };
}
