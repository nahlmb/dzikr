import 'package:flutter/foundation.dart';

class DzikrErrorConfig implements Exception {
  DzikrErrorConfig(this.cause, this.message);
  String cause;
  String message;

  static String causeLocation = "Location Error";
  static String causeNetworkReqeust = "Network Request Error";
  static String causeNull = "Null Exception Error";

  /// doTry() Fuction will allow [ErrorConfig] to run your function (via high order function params),
  /// and automaticly handle exception by [ErrorConfig] standart response to exception
  static Future doTry(Function action) async {
    String errorTitle = "DzikrErrorConfig";
    bool isError = false;
    String errorCause = "";
    String errorText = "";
    try {
      await action();
    } catch (e) {
      isError = true;

      // Recognize Global Error exception
      errorCause = "external error";
      errorText = "$errorTitle -recognize global error- ${e.runtimeType} : $e";
      printOnDebug(errorText);

      // Recognize DzikrErrorConfig exception
      if (e.runtimeType == DzikrErrorConfig) {
        var error = e as DzikrErrorConfig;
        errorCause = error.cause;
        errorText =
            "$errorTitle, cause = ${error.cause}, error message = ${error.message}";
        printOnDebug(errorText);
      }
    }
    if (isError) throw DzikrErrorConfig(errorCause, errorText);
  }
}

printOnDebug(dynamic content) {
  if (kDebugMode) {
    print(content);
  }
}
