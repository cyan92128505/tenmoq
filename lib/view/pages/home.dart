import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

import 'package:tenmoq/redux/app/state.dart';

class HomePage extends StatelessWidget {
  final AppState state;
  HomePage(this.state);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeVM>(
      converter: HomeVM.fromStore,
      builder: (BuildContext context, HomeVM viewModel) {
        return MaterialApp(
          title: 'Tenmoq',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeView(viewModel),
        );
      },
    );
  }
}

class HomeVM {
  final Store<AppState> store;

  HomeVM({
    @required this.store,
  });

  static HomeVM fromStore(Store<AppState> store) {
    return HomeVM(store: store);
  }
}

class HomeView extends StatefulWidget {
  final HomeVM viewModel;

  HomeView(this.viewModel);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String qrText = '';
  QRViewController controller;

  String jsonString = '''
{
  "type": "BindingValue",
  "binding_target": "demo"
}
  ''';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text('Scan result: $qrText'),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: DynamicWidgetBuilder().build(
                        jsonString,
                        context,
                        DefaultClickListener(),
                      ),
                    ),
                  ),
                  Text(
                    'version: ${widget.viewModel.store.state.settingState.version}',
                  )
                ],
              ),
            ),
          ],
        ),
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

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String event) {
    print("Receive click event: " + event);
  }
}
