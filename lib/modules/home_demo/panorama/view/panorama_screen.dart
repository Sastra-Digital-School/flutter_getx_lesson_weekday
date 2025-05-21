import 'package:flutter/material.dart';
import 'package:flutter_project_getx/widgets/animation_icon_widget.dart';
import 'package:flutter_project_getx/widgets/icon_button_widget.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';

class PanoramaScene1 extends StatelessWidget {
  const PanoramaScene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
            hotspots: [
              Hotspot(
                latitude: -10,
                longitude: 220,
                width: 60,
                height: 60,
                widget: AnimatedPulsingIcon(
                  onTap: () {
                    Get.to(PanoramaScene2());
                  },
                ),
              ),
              Hotspot(
                latitude: -10,
                longitude: 180,
                width: 60,
                height: 60,
                widget: AnimatedPulsingIcon(
                  onTap: () {
                    Get.to(PanoramaScene2());
                  },
                ),
              ),
            ],
            onTap: (x, y, z) {
              Get.to(PanoramaScene2());
            },
            child: Image.asset(
              'assets/vecteezy_a-modern-apartment-empty-entrance-hall-with-pink-glass-door_25489679.jpg',
            ),
            // child: Image.network(
            //   'assets/vecteezy_a-modern-apartment-empty-entrance-hall-with-pink-glass-door_25489679.jpg',
            //   // 'https://cdn-ilblmij.nitrocdn.com/DLIZsQDvOcOKWcuSosUGkNHekDNKXxlQ/assets/images/optimized/rev-8feb66c/threesixty.tours/wp-content/uploads/2024/10/traditionalimage_upload-170913_1505326171212-scaled.jpg',
            // ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonWidget(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PanoramaScene2 extends StatefulWidget {
  const PanoramaScene2({super.key});

  @override
  State<PanoramaScene2> createState() => _PanoramaScene2State();
}

class _PanoramaScene2State extends State<PanoramaScene2> {
  bool isRotating = true;
  double animSpeed = 1.0;

  void toggleRotation() {
    setState(() {
      if (isRotating) {
        animSpeed = 0.0001;
      } else {
        animSpeed = 1.0;
      }
      isRotating = !isRotating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
            animSpeed: animSpeed,
            hotspots: [
              Hotspot(
                latitude: 1,
                longitude: 33,
                width: 60,
                height: 60,
                widget: AnimatedPulsingIcon(
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
            child: Image.network(
              'https://www.aimircg.com/wp-content/uploads/2023/04/architectural-visualization-3d-rendering-services-interior-cgi-360-virtual-tour-panorama-0-1080x675.jpg',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: toggleRotation,
        child: Icon(
          isRotating ? Icons.pause : Icons.play_arrow, // Update icon
          color: Colors.white,
        ),
      ),
    );
  }
}
