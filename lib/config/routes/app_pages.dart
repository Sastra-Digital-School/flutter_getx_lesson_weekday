import 'package:flutter_project_getx/config/routes/app_routes.dart';
import 'package:flutter_project_getx/modules/home/controller/home_controller.dart';
import 'package:flutter_project_getx/modules/notification/notification_binding.dart';
import 'package:flutter_project_getx/modules/notification/notification_screen.dart';
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
        }
      }).toList();
}
