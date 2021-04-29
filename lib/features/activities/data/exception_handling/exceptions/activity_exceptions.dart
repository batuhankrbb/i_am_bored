abstract class ActivityException implements Exception {
  final Exception? exception;

  ActivityException({this.exception});
}

class ActivityNoCachedException extends ActivityException {
  ActivityNoCachedException({Exception? exception})
      : super(exception: exception);
}

class UnknownLocalException extends ActivityException {
  UnknownLocalException({Exception? exception}) : super(exception: exception);
}

class DeletingActivityException extends ActivityException {
  DeletingActivityException({Exception? exception})
      : super(exception: exception);
}

class UnknownRemoteException extends ActivityException {
  UnknownRemoteException({Exception? exception}) : super(exception: exception);
}

class NoInternetException extends ActivityException {
  NoInternetException({Exception? exception}) : super(exception: exception);
}

class ForbiddenActivityException extends ActivityException {
  ForbiddenActivityException({Exception? exception})
      : super(exception: exception);
}
