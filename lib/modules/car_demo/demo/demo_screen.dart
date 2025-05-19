import 'package:flutter/material.dart';
import 'package:flutter_project_getx/modules/car_demo/widget/car_3d_demo_widget.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade300, body: _buildBody);
  }

  get _buildBody {
    return Stack(
      alignment: Alignment.center,
      children: [
        Car3DDemoWidget(),
        Positioned(
          top: 100,
          child: Text(
            '3D Tesla Demo',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
