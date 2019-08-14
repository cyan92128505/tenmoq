import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'redux/app/state.dart';
import 'redux/app/middleware.dart';
import 'redux/app/reducer.dart';
import 'redux/setting/state.dart';

void main() => runApp(ReduxApp(getReduxAppConfig()));

ReduxAppConfig getReduxAppConfig() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Store<AppState> store = Store<AppState>(appReducer,
      initialState: AppState(),
      middleware: []..addAll(createStorePersistenceMiddleware()));

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
          return Tenmoq(state);
        },
      ),
    );
  }
}

class Tenmoq extends StatelessWidget {
  final AppState state;
  Tenmoq(this.state);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenmoq',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TenmoqView(state),
    );
  }
}

class TenmoqView extends StatefulWidget {
  final AppState state;

  TenmoqView(this.state);
  @override
  _TenmoqViewState createState() => _TenmoqViewState();
}

class _TenmoqViewState extends State<TenmoqView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String qrText = '';
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Text('Scan result: $qrText'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text('version: ${widget.state.settingState.version}'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
