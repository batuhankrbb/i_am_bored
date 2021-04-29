import 'package:dio/dio.dart';
import 'package:im_bored_app/core/utils/error_printer.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/activity_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
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
          responseType: DEFAULT_ACTIVITY_MODEL,
          options: ActivityClient.activityByType(type));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
       printError(
          "ActivityRemoteDataSourceImplementation/getActivityByType", e);
     throw _handleErrorStatusCode(e.response?.statusCode);
    }
  }

  @override
  Future<ActivityModel> getRandomActivity() async {
   try {
      var response = await _executer.execute<ActivityModel, ActivityModel>(
          responseType: DEFAULT_ACTIVITY_MODEL,
          options: ActivityClient.activityRandom());
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      printError(
          "ActivityRemoteDataSourceImplementation/getRandomActivity", e);
     throw _handleErrorStatusCode(e.response?.statusCode);
    }
  }

  ActivityException _handleErrorStatusCode(int? statusCode) {
    if (statusCode == null) {
      return UnknownRemoteException();
    }
    switch (statusCode) {
      case 403:
        return ForbiddenActivityException();
      case 599:
        return NoInternetException();
      default:
        return UnknownRemoteException();
    }
  }
}

/*
class UnknownRemoteException extends ActivityException{
  UnknownRemoteException({Exception? exception}) : super(exception: exception);
}

class NoInternetException extends ActivityException{
  NoInternetException({Exception? exception}) : super(exception: exception);
}

class ForbiddenActivityException extends ActivityException {
  ForbiddenActivityException({Exception? exception})
      : super(exception: exception);
}
*/
