import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/presentation/screens/home/page/activity_detail_page.dart';
import 'package:im_bored_app/features/activities/presentation/screens/home/page/im_not_page.dart';

import 'core/user_interface/themes/app_theme_dark.dart';
import 'features/activities/presentation/screens/home/page/main_page.dart';
import 'features/activities/starting_files/get_it_injection_container.dart';
import 'features/activities/starting_files/hive_starting_setup.dart';

void main() async {
  await setUpHive();
  setUpGetIt();
  runApp(DevicePreview(
    builder: (_) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "You can't be bored!",
      theme: AppThemeDark().theme,
      home: ActivityDetailPage(),
    );
  }
}
