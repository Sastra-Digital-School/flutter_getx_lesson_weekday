import 'package:flutter/cupertino.dart';
import 'package:flutter_project_getx/config/routes/app_routes.dart';
import 'package:flutter_project_getx/modules/home_demo/home/controller/home_controller.dart';
import 'package:flutter_project_getx/modules/home_demo/home/controller/home_detail_controller.dart';
import 'package:flutter_project_getx/modules/shop/home/controller/home_controller.dart';
import 'package:flutter_project_getx/modules/shop/notification/notification_binding.dart';
import 'package:flutter_project_getx/modules/shop/notification/notification_screen.dart';
import 'package:get/get.dart';

class AppRouting {
  static final route =
      RouteView.values.map((e) {
        switch (e) {
          case RouteView.home:
            return GetPage(
              name: "/",
              page: () => HomeResponsive(),
              transition: Transition.noTransition,
            );
          case RouteView.notification:
            return GetPage(
              name: "/${e.name}",
              page: () => NotificationScreen(),
              binding: NotificationBinding(),
            );
          case RouteView.location:
            return GetPage(
              name: "/${e.name}",
              page: () => Container(),
              binding: NotificationBinding(),
            );
          case RouteView.homedemo:
            return GetPage(
              name: "/${e.name}",
              page: () => HomeDemoController(),
            );
          case RouteView.homedetail:
            return GetPage(
              name: "/${e.name}",
              page: () => HomeDemoDetailController(),
              binding: NotificationBinding(),
            );
        }
      }).toList();
}
