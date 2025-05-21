import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/function/function.dart';
import 'package:flutter_project_getx/config/theme/theme_style.dart';
import 'package:flutter_project_getx/modules/home_demo/panorama/view/panorama_screen.dart';
import 'package:flutter_project_getx/widgets/icon_button_widget.dart';
import 'package:get/get.dart';

class HouseDetailScreen extends StatelessWidget {
  const HouseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: Stack(
        children: [_buildImageHeader(context), _buildDetailSection(context)],
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(Get.parameters['image'] ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
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
                  IconButtonWidget(
                    icon: Icons.view_in_ar,
                    onPressed: () => Get.to(PanoramaScene1()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
        ),
        child: Icon(icon, size: 24, color: Colors.black),
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitleSection(),
            _buildDescription(),
            _buildAmenities(),
            _buildPriceAndButton(context),
          ].withSpaceBetween(height: 30),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Get.parameters['title'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Toronto, Ontario",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        _iconButton(Icons.bookmark_border, () {}),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      "This place is perfect for a big family. Here you will find all facilities "
      "that an apartment should have. And there's also some special facility that other "
      "Read More...",
      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
    );
  }

  Widget _buildAmenities() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _amenityIcon(Icons.bed, "Bedroom"),
        _amenityIcon(Icons.bathtub, "Bathroom"),
        _amenityIcon(Icons.local_parking, "Parking"),
      ],
    );
  }

  Widget _amenityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }

  Widget _buildPriceAndButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Get.parameters['price'] ?? '',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Per month with Tax",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            "Book Now",
            style: AppTextStyle.bold17(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
