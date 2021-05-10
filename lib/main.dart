import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/hive/hive_helper.dart';
import 'core/navigation/routes/navigation_routes.dart';
import 'core/navigation/services/navigation_service.dart';
import 'core/navigation/services/router_service.dart';
import 'core/user_interface/themes/app_theme_dark.dart';
import 'features/activities/presentation/sections/home/pages/home_page/home_page.dart';
import 'features/activities/starting_files/get_it_injection_container.dart';

void main() async {
  await HiveHelper().setUpHive();
  setUpGetIt();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: "You can't be bored!",
      initialRoute: NavigationRoute.homePage(HomePage()).rawValue,
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: RouterService.generateCustomRoute,
      theme: AppThemeDark().theme,
      home: HomePage(),
    );
  }
}
