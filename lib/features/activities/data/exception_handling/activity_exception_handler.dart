import '../../../../core/error_handling/custom_failure.dart';
import '../data_sources/exceptions/activity_exceptions.dart';

class ActivityExceptionHandler {
  CustomFailure handleException(ActivityException exception) {
    if (exception is UnknownLocalException) {
      return CustomFailure(message: "Oh! Something went wrong in Local :(");
    } else if (exception is UnknownRemoteException) {
      return CustomFailure(message: "Oh! Something went wrong in Remote :(");
    } else if (exception is ActivityZeroFavoriteException) {
      return CustomFailure(
          message:
              "Oh! You have no internet connection and It's your first time.");
    } else if (exception is NoInternetException) {
      return CustomFailure(message: "It seems like you have some connection problems.");
    } else {
      throw Exception("App Crashed in ActivityExceptionHandler");
    }
  }
}
