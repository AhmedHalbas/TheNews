import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'alert_dialog.dart';

void checkInternet(BuildContext context, var json) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('There is an Internet Connection');
    }
  } on SocketException catch (_) {
    if (json == null) {
      return showAlertDialog(
        context,
        isDismissible: false,
        title: 'Internet Connection Issue',
        content: 'Please Enable Your Internet Connection',
        buttonText: 'Ok',
        onPressed: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
      );
    }
  }
}

void checkInternetLoading(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('There is an Internet Connection');
    }
  } on SocketException catch (_) {
    return showAlertDialog(
      context,
      isDismissible: false,
      title: 'Internet Connection Issue',
      content: 'Please Enable Your Internet Connection',
      buttonText: 'Ok',
      onPressed: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );
  }
}
