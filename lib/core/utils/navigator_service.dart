import 'package:demo/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {
    hideKeyboard();
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, Widget routeChild,
      {dynamic argument}) async {
    logV("argument====>$argument");
    hideKeyboard();
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => routeChild,
        settings: RouteSettings(arguments: argument),
      ),
    );
  }

  static Future<dynamic> pushReplace(
      BuildContext context, Widget routeChild) async {
    await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 220),
        reverseTransitionDuration: const Duration(milliseconds: 220),
        pageBuilder: (context, animation, secondaryAnimation) => routeChild,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  static goBack({dynamic arguments}) {
    hideKeyboard();
    return navigatorKey.currentState?.pop(arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    hideKeyboard();
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    hideKeyboard();
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
