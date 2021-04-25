abstract class NetworkOptionsGenerator {
  const NetworkOptionsGenerator();
  String get networkPath;
  String get networkMethod;
  String get baseURL;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic>? get header;
}

/*
 late int  receiveTimeout;
  late int  sendTimeout;
  late String  contentType;
  late bool  receiveDataWhenStatusError;
  late bool  followRedirects;
  late int  maxRedirects;
*/
