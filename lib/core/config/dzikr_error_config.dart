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
    try {
      await action();
    } catch (e) {
      // Recognize Global Error exception
      printOnDebug("$errorTitle : recognize global error : $e");

      // Recognize DzikrErrorConfig exception
      if (e.runtimeType == DzikrErrorConfig) {
        var error = e as DzikrErrorConfig;
        printOnDebug(
            "$errorTitle : error! : error cause = ${error.cause}. : error message = ${error.message}");
      }
    }
  }
}

printOnDebug(dynamic content) {
  if (kDebugMode) {
    print(content);
  }
}
