import 'package:flutter/widgets.dart';
import 'package:im_bored_app/core/navigation/routes/navigation_routes.dart';

class NavigationService {
  NavigationService._();

  static final NavigationService _NavigationServiceInstance =
      NavigationService._();

  factory NavigationService() {
    return _NavigationServiceInstance;
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(NavigationRoute route) {
    if (navigatorKey.currentState == null) {
      return null;
    }
    return navigatorKey.currentState!
        .pushNamed(route.rawValue, arguments: route);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
