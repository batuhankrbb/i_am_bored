import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/hive/activity_entity_adapter.dart';

Future<void> setUpHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityEntityHiveAdapter());
}
