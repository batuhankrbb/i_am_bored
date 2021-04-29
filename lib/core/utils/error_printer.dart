class ErrorHelper {
  ErrorHelper._();

  static final ErrorHelper _errorHelperInstance = ErrorHelper._();

  factory ErrorHelper() {
    return _errorHelperInstance;
  }

  void printError(String errorLocation, Object e) {
    print("Error has occured in $errorLocation. ErrorString: ${e.toString()}");
  }
}
