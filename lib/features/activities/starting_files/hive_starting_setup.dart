import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:im_bored_app/features/activities/utils/hive/activity_entity_adapter.dart';

Future<void> setUpHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityEntityHiveAdapter());
}
