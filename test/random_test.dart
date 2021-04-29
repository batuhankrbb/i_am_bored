import 'package:flutter_test/flutter_test.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/local_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/data_sources/implementations/local_data_source_implementation.dart';
import 'package:im_bored_app/features/activities/data/data_sources/implementations/remote_data_source_implementation.dart';
import 'package:im_bored_app/features/activities/data/exception_handling/exceptions/activity_exceptions.dart';
import 'package:im_bored_app/features/activities/utils/activity_types.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  group("random stuff", () {
    test("print stuff", () async {     
    });

    test("about hive", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
  });
}