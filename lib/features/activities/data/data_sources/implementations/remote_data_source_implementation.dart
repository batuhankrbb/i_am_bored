import 'package:dio/dio.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/activity_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
import '../../../../../core/utils/error_printer.dart';
import '../../exception_handling/exceptions/activity_exceptions.dart';
import '../../models/activity_model.dart';
import '../contracts/remote_data_source_contract.dart';


class ActivityRemoteDataSourceImplementation
    implements ActivityRemoteDataSourceContract {

  var _executer = NetworkExecuter();

  @override
  Future<ActivityModel> getActivityByType(String type) async {
    try {
      var response = await _executer.execute<ActivityModel, ActivityModel>(
          responseType: DefaultResponseTypes().DEFAULT_ACTIVITY_MODEL,
          options: ActivityClient.activityByType(type));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
       ErrorHelper().printError(
          "ActivityRemoteDataSourceImplementation/getActivityByType", e);
     throw _handleErrorStatusCode(e.response?.statusCode);
    }
  }

  @override
  Future<ActivityModel> getRandomActivity() async {
   try {
      var response = await _executer.execute<ActivityModel, ActivityModel>(
          responseType: DefaultResponseTypes().DEFAULT_ACTIVITY_MODEL,
          options: ActivityClient.activityRandom());
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "ActivityRemoteDataSourceImplementation/getRandomActivity", e);
     throw _handleErrorStatusCode(e.response?.statusCode);
    }
  }

  ActivityException _handleErrorStatusCode(int? statusCode) {
    if (statusCode == null) {
      return ActivityException.unknownRemoteException();
    }
    switch (statusCode) {
      case 403:
        return ActivityException.forbiddenActivityException();
      case 599:
        return ActivityException.noInternetException();
      default:
        return ActivityException.unknownRemoteException();
    }
  }
}
