import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
}

class NoTransitionRoute<T> extends MaterialPageRoute<T> {
  NoTransitionRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class DialogTransitionRoute<T> extends PageRouteBuilder<T> {
  DialogTransitionRoute({Widget page, Color barrirtColor})
      : super(
          opaque: false,
          barrierColor: barrirtColor ?? Color.fromARGB(127, 22, 22, 22),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: _prepareTransitionsBuilder,
        );

  static Widget _prepareTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 1.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}
