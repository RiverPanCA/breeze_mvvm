import 'package:flutter/material.dart';

class ActiveRef {

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}
