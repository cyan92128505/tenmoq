import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:tenmoq/redux/app/state.dart';

class HomePage extends StatelessWidget {
  final AppState state;
  HomePage(this.state);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenmoq',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(state),
    );
  }
}

class HomeView extends StatefulWidget {
  final AppState state;

  HomeView(this.state);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
