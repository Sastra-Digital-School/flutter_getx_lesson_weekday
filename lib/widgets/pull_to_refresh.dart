import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshList extends StatelessWidget {
  final Widget child;
  final VoidCallback onRefresh;
  final RefreshController controller;

  const PullToRefreshList({
    super.key,
    required this.child,
    required this.onRefresh,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: onRefresh,
      header: const WaterDropHeader(
        complete: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, color: Colors.grey),
            Text(
              'Refresh completed',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}
