import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/app/state.dart';
import 'redux/app/middleware.dart';
import 'redux/app/reducer.dart';
import 'parsers/index.dart';
import 'view/pages/index.dart';
import 'routes.dart';

void main() => runApp(ReduxApp(getReduxAppConfig()));

ReduxAppConfig getReduxAppConfig() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: []..addAll(
        createStorePersistenceMiddleware(),
      ),
  );

  CustomParserTool.setup();

  return ReduxAppConfig(
    navigatorKey: navigatorKey,
    store: store,
  );
}

class ReduxAppConfig {
  final GlobalKey<NavigatorState> navigatorKey;
  final Store<AppState> store;
  ReduxAppConfig({this.navigatorKey, this.store});
}

class ReduxApp extends StatefulWidget {
  final ReduxAppConfig config;
  ReduxApp(this.config);

  @override
  _ReduxAppState createState() => _ReduxAppState();
}

class _ReduxAppState extends State<ReduxApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StoreProvider(
      store: widget.config.store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
              navigatorKey: widget.config.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Tenmoq',
              initialRoute: AppRoutes.splash,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case AppRoutes.splash:
                    return NoTransitionRoute(
                        builder: (_) => SplashPage(), settings: settings);
                  case AppRoutes.home:
                    return NoTransitionRoute(
                        builder: (_) => HomePage(state), settings: settings);
                  default:
                    return null;
                }
              });
        },
      ),
    );
  }
}
