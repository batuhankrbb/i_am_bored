import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/services/navigation_service.dart';

class AlertHelper {
  AlertHelper._();

  static final AlertHelper _alertHelperInstance = AlertHelper._();

  factory AlertHelper() {
    return _alertHelperInstance;
  }

  void showCupertinoAlertDialog(
      String title, String message, BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
               isDefaultAction: true,
               onPressed: (){
                  NavigationService().goBack();
               },
              )
            ],
          );
        });
  }
}
