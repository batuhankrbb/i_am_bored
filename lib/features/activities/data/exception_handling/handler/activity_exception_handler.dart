import '../../../../../core/error_handling/custom_failure.dart';
import '../exceptions/activity_exceptions.dart';

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
      return CustomFailure(
          message: "It seems like you have some connection problems.");
    } else if (exception is DeletingActivityException) {
      return CustomFailure(message: "Oh! We couldn't delete this favorite.");
    } else if (exception is ForbiddenActivityException){
       return CustomFailure(message: "Oh! What you are trying to do is forbidden.");
    }else {
      throw Exception("App Crashed in ActivityExceptionHandler");
    }
  }
}
