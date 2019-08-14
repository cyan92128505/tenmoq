import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tenmoq/routes.dart';
import 'package:tenmoq/redux/app/actions.dart';
import 'package:tenmoq/redux/app/state.dart';

class SplashVM {
  final void Function(dynamic callback) onInit;

  SplashVM({
    @required this.onInit,
  });

  static SplashVM fromStore(Store<AppState> store) {
    return SplashVM(
      onInit: (dynamic callback) {
        final Completer<Null> completer = Completer<Null>();

        completer.future.then((_) {
          callback();
        });

        completer.complete();
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SplashVM>(
      converter: SplashVM.fromStore,
      builder: (BuildContext context, SplashVM viewModel) {
        return SplashView(viewModel: viewModel);
      },
    );
  }
}

class SplashView extends StatefulWidget {
  final SplashVM viewModel;

  const SplashView({Key key, @required this.viewModel}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer _debounce;

  _handleAfterInit() {
    _debounce = Timer(
      Duration(milliseconds: 1500),
      () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.viewModel.onInit(_handleAfterInit);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('TENMOQ'),
            ),
          ),
          SizedBox(
            height: 4.0,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
