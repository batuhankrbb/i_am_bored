import '../../../../../core/error_handling/custom_failure.dart';
import '../exceptions/activity_exceptions.dart';

class ActivityExceptionHandler {
  CustomFailure handleException(ActivityException exception) {
   return exception.when(
        noCachedException: () {
           return CustomFailure(
          message:
              "Oh! You have no internet connection and It's your first time.");
        },
        unknownLocalException: () {
          return CustomFailure(message: "Oh! Something went wrong with your device :(");
        },
        deletingActivityException: () {
            return CustomFailure(message: "Oh! We couldn't delete this favorite.");
        },
        unknownRemoteException: () {
          return CustomFailure(message: "Oh! Something went wrong with the internet:(");
        },
        noInternetException: () {
          return CustomFailure(
          message: "It seems like you have some connection problems.");
        },
        forbiddenActivityException: () {
           return CustomFailure(
          message: "Oh! What you are trying to do is forbidden.");
        });
  }
}
