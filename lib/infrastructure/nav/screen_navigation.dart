import 'package:flutter/material.dart';
import 'package:simple_mvvm/home_page.dart';
import 'package:simple_mvvm/home_page_view_model.dart';

import 'nav_route.dart';

class ScreenNavigation {
  static String initialRoute() {
    return NavRoute.home;
  }

  static Map<String, WidgetBuilder> getRouteMap() {
    final view = ScreenView();

    final routeMap = <String, WidgetBuilder>{
      NavRoute.home: (context) => view.home(),
    };

    return routeMap;
  }
}

class ScreenView {
  Widget home() => HomePage(
        HomePageViewModel(),
        title: 'Home',
      );
}
