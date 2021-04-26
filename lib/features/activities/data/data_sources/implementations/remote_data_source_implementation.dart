import 'package:dio/dio.dart';
import 'package:im_bored_app/core/constants/response_types.dart';
import 'package:im_bored_app/core/network/network_executer.dart';
import 'package:im_bored_app/core/network_clients/activity_client.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/remote_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/exception_handling/exceptions/activity_exceptions.dart';
import 'package:im_bored_app/features/activities/data/models/activity_model.dart';


//TODO Apply DRY here.
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
