import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertUtil {
  AlertUtil(this.context) {
    fToast = FToast();
    fToast.init(context);
  }

  BuildContext context;

  late FToast fToast;

  /*
  Calling this from build() requires a delay so there isn't a runtime conflict
      Future.delayed(Duration(milliseconds: 500), () {
      ALERT.showToastTopShort('TEST: ALERT.showToastTopShort');
    });
   */
  showToastTopShort(String msgText) {
    fToast.showToast(
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 5),
      positionedToastBuilder: (context, child) {
        // other settings relative to gravity: , // top: 50,  // left: SCALE.w(0.25)
        return Positioned(child: child);
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // border: Border.all(width: 1, color: Colors.grey),
            color: Colors.blue[600],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(msgText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    // fontSize: SCALE.h(0.025),
                  ))),
    );
  }

  showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showErrorDialog1(String message, {String title = 'ERROR'}) {
    showAlertDialog(title, message);
  }

  showErrorDialog(String message, {String title = 'Contact Admin'}) {
    showAlertDialog(title, message);
  }

  showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(child: Text(message)),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
