import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/routes/app_pages.dart';
import 'package:flutter_project_getx/config/routes/app_routes.dart';
import 'package:flutter_project_getx/modules/shop/home/binding/home_binding.dart';
import 'package:flutter_project_getx/config/theme/theme_style.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: HomeBinding(),
      initialRoute: RouteView.home.name,
      getPages: AppRouting.route,
      // home: DemoScreen(),
    );
  }
}
