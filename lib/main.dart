import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:redux/redux.dart';

import 'redux/app/state.dart';
import 'redux/app/middleware.dart';
import 'redux/app/reducer.dart';

void main() => runApp(Tenmoq());

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

class Tenmoq extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenmoq',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TenmoqView(),
    );
  }
}

class TenmoqView extends StatefulWidget {
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
