import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/responsive/main_responsive.dart';
import 'package:flutter_project_getx/core/string/string_con.dart';
import 'package:flutter_project_getx/modules/home_demo/home/model/card_model.dart';
import 'package:flutter_project_getx/modules/home_demo/home/view/home_screen.dart';
import 'package:get/get.dart';

class HomeControllerGet extends GetxController {
  List<CardModel> get cardInfo => List.generate(cardTitle.length, (index) {
    return CardModel(
      title: cardTitle[index],
      price: cardPrice[index],
      image: cardImage[index],
    );
  });
}

class HomeDemoController extends StatefulWidget {
  const HomeDemoController({super.key});

  @override
  State<HomeDemoController> createState() => _HomeDemoControllerState();
}

class _HomeDemoControllerState extends State<HomeDemoController> {
  var controller = Get.put(HomeControllerGet());
  @override
  Widget build(BuildContext context) {
    return MainResponsive(small: HomeScreen(controller: controller));
  }
}
