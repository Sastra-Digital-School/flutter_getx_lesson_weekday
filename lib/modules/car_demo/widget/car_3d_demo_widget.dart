import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_project_getx/modules/car_demo/widget/button_shawdo.dart';
import 'package:flutter_project_getx/modules/car_demo/widget/select_option_button.dart';

class Car3DDemoWidget extends StatefulWidget {
  const Car3DDemoWidget({super.key});

  @override
  State<Car3DDemoWidget> createState() => _Car3DDemoWidgetState();
}

class _Car3DDemoWidgetState extends State<Car3DDemoWidget> {
  final Flutter3DController _flutter3DController = Flutter3DController();

  void cameraStep() {
    _flutter3DController.setCameraOrbit(-100, 88, 500);
    _flutter3DController.setCameraTarget(-150, 0, -20);
  }

  void cameraTop() {
    _flutter3DController.setCameraOrbit(0, 0, 80);
    _flutter3DController.setCameraTarget(0, 0, 80);
  }

  void cameraLeft() {
    _flutter3DController.setCameraOrbit(-135, 80, 90);
    _flutter3DController.setCameraTarget(35, 0, 0);
  }

  void cameraBackLeft() {
    _flutter3DController.setCameraOrbit(-400, 80, 90);
    _flutter3DController.setCameraTarget(35, 0, 0);
  }

  void cameraRight() {
    _flutter3DController.setCameraOrbit(135, 80, 90);
    _flutter3DController.setCameraTarget(-35, 0, 0);
  }

  void cameraBackRight() {
    _flutter3DController.setCameraOrbit(400, 80, 90);
    _flutter3DController.setCameraTarget(-35, 0, 0);
  }

  void cameraFront() {
    _flutter3DController.setCameraOrbit(180, 75, 80);
    _flutter3DController.setCameraTarget(0, 0, 0);
  }

  void cameraBack() {
    _flutter3DController.setCameraOrbit(0, 75, 80);
    _flutter3DController.setCameraTarget(0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Flutter3DViewer(
          src: 'assets/3d/car/tesla_2018_model_3.glb',
          controller: _flutter3DController,
          progressBarColor: Colors.transparent,
          onLoad: (sceneName) async {
            cameraTop();
          },
        ),
        Positioned(
          top: 150,
          child: NeumorphicButtonWidget(
            label: 'Testing Button',
            onPressed: () {},
          ),
        ),
        // Style the buttons
        Positioned(
          bottom: 50,
          child: CustomNeumorphicRadio(
            onChangedTFB: (index) {
              switch (index) {
                case 0:
                  cameraFront();
                  break;
                case 1:
                  cameraTop();
                  break;
                case 2:
                  cameraBack();
                  break;
              }
            },
            onChangedRound: (index) {
              switch (index) {
                case 0:
                  cameraBackRight();
                  break;
                case 1:
                  cameraRight();
                  break;
                case 2:
                  cameraLeft();
                  break;
                case 3:
                  cameraBackLeft();
                  break;
                default:
              }
            },
          ),
        ),
        // Style the buttons
        // Positioned(
        //   left: 30,
        //   child: Column(
        //     spacing: 68,
        //     children: [
        //       NeumorphicButtonWidget(
        //         label: '',
        //         onPressed: () {
        //           cameraLeft();
        //         },
        //       ),
        //       NeumorphicButtonWidget(
        //         label: '',
        //         onPressed: () {
        //           cameraBackLeft();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // Positioned(
        //   right: 30,
        //   child: Column(
        //     spacing: 68,
        //     children: [
        //       NeumorphicButtonWidget(
        //         label: '',
        //         onPressed: () {
        //           cameraRight();
        //         },
        //       ),
        //       NeumorphicButtonWidget(
        //         label: '',
        //         onPressed: () {
        //           cameraBackRight();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // Positioned(
        //   top: 290,
        //   child: NeumorphicButtonWidget(
        //     label: '',
        //     onPressed: () {
        //       cameraFront();
        //     },
        //   ),
        // ),
        // Positioned(
        //   bottom: 250,
        //   child: NeumorphicButtonWidget(
        //     label: '',
        //     onPressed: () {
        //       cameraBack();
        //     },
        //   ),
        // ),
        // NeumorphicButtonWidget(
        //   label: '',
        //   onPressed: () {
        //     cameraTop();
        //   },
        // ),
      ],
    );
  }
}
