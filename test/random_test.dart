import 'package:flutter_test/flutter_test.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/remote_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/data_sources/implementations/remote_data_source_implementation.dart';
import 'package:im_bored_app/features/activities/data/exception_handling/exceptions/activity_exceptions.dart';

void main() {
  group("random stuff", () {
    test("print stuff", () async {
      var testService = ActivityRemoteDataSourceImplementation();
      try {
        var activity = await testService.getRandomActivity();
        print(activity.toString());
        print(activity.accessibility);
      } on ActivityException catch (e) {
        print(e.toString());
      }
    });
  });
}
