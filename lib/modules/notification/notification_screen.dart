import 'package:flutter/material.dart';
import 'package:flutter_project_getx/modules/notification/notification_controller.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar:
            controller.loading.value
                ? AppBar(title: Text('Notifications'))
                : null,
        body: controller.loading.value ? _buildShimmer : _buildBody,
      ),
    );
  }

  get _buildBody {
    return CustomScrollView(slivers: [_buildAppBar, _buildSliverList]);
  }

  get _buildAppBar {
    return SliverAppBar(title: Text('Notifications'));
  }

  get _buildSliverList {
    List<String> titleList = ['New', 'Today', 'Earlier'];

    var dataNew = controller.notificationDataModel.data?.dataNew?.datas;
    var dataToday = controller.notificationDataModel.data?.today?.datas;
    var dataEarlier = controller.notificationDataModel.data?.earlier?.datas;

    return SliverList.builder(
      itemCount: titleList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleList[index]),
              switch (index) {
                0 => NotificationData(data: dataNew),
                1 => NotificationData(data: dataToday),
                2 => NotificationData(data: dataEarlier),
                int() => SizedBox(),
              },
            ],
          ),
        );
      },
    );
  }

  get _buildShimmer {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(radius: 36),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationData extends StatelessWidget {
  final List? data;
  const NotificationData({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: List.generate(data?.length ?? 0, (index) {
        return Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage(data?[index].image ?? ''),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${data?[index].description}',
                          style: GoogleFonts.leagueSpartan(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                      ],
                      text: '${data?[index].name} ',
                      style: GoogleFonts.leagueSpartan(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
