class NumberHelper {
  NumberHelper._();

  static final NumberHelper _NumberHelperInstance = NumberHelper._();

  factory NumberHelper() {
    return _NumberHelperInstance;
  }

  String fixDouble(double number, int digitNumber) {
    return number.toStringAsFixed(digitNumber);
  }
}
