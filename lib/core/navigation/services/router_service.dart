import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../routes/navigation_routes.dart';

class RouterService {
  static Route<dynamic> generateCustomRoute(RouteSettings settings) {
    NavigationRoute route = settings.arguments as NavigationRoute;

    return route.when(
      chooseTypePage: (page) {
        return _convertToRoute(page);
      },
      iAmNotBoredPage: (page) {
        return _convertToRoute(page);
      },
      homePage: (page) {
        return _convertToRoute(page);
      },
      activityDetailPage: (page) {
        return _convertToRoute(page);
      },
      favoriteDetailPage: (page) {
        return _convertToRoute(page);
      },
      favoritesPage: (page) {
        return _convertToRoute(page);
      },
    );
  }

  static CupertinoPageRoute _convertToRoute(Widget page) {
    return CupertinoPageRoute(builder: (_) => page);
  }
}
