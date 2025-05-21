import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/function/function.dart';
import 'package:flutter_project_getx/config/routes/app_routes.dart';
import 'package:flutter_project_getx/config/theme/theme_style.dart';
import 'package:flutter_project_getx/modules/home_demo/home/controller/home_controller.dart';
import 'package:flutter_project_getx/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeControllerGet controller;
  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildTitle(),
              _buildCategoryTabs(),
              Expanded(child: _buildHouseList()),
            ].withSpaceBetween(height: 25),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black.withValues(alpha: 0.1),
          child: Icon(Icons.dashboard_rounded, color: Colors.black),
        ),
        Icon(Icons.search, size: 30, color: Colors.black),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find The",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          "Perfect Home",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Discover the best home for you",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTab("Recent", false),
        _buildTab("Popular", true),
        _buildTab("Bestseller", false),
      ],
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow:
            isSelected ? [BoxShadow(color: Colors.black26, blurRadius: 5)] : [],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildHouseList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.cardInfo.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildHouseCard(
          controller.cardInfo[index].title,
          controller.cardInfo[index].price,
          controller.cardInfo[index].image,
          index,
        );
      },
    );
  }

  Widget _buildHouseCard(
    String title,
    String price,
    String imageUrl,
    int index,
  ) {
    return Container(
      width: 330,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(imageUrl, fit: BoxFit.cover, height: 200),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: AppTextStyle.regular22(color: Colors.white)),
                Text(price, style: AppTextStyle.bold22(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: GestureDetector(
              onTap: () {
                RouteView.homedetail.go(
                  parameters: {
                    'image': controller.cardInfo[index].image,
                    'title': controller.cardInfo[index].title,
                    'price': controller.cardInfo[index].price,
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "View Home",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.black.withValues(alpha: 0.6),
              child: Icon(Icons.favorite_border, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
