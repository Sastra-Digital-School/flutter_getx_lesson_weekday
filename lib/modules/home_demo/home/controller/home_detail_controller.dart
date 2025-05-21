import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/responsive/main_responsive.dart';
import 'package:flutter_project_getx/modules/home_demo/home/view/home_detail_screen.dart';
import 'package:get/get.dart';

class HomeDetailControllerGet extends GetxController {}

class HomeDemoDetailController extends StatefulWidget {
  const HomeDemoDetailController({super.key});

  @override
  State<HomeDemoDetailController> createState() => _HomeDemoDetailControllerState();
}

class _HomeDemoDetailControllerState extends State<HomeDemoDetailController> {
  var controller = Get.put(HomeDetailControllerGet());
  @override
  Widget build(BuildContext context) {
    return MainResponsive(small: HouseDetailScreen());
  }
}
