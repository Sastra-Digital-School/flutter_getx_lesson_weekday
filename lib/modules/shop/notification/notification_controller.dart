import 'package:flutter_project_getx/core/data/data.dart';
import 'package:flutter_project_getx/modules/shop/notification/notification_data_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationDataModel notificationDataModel = NotificationDataModel();

  var loading = true.obs;

  Future<NotificationDataModel> loadingData() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    notificationDataModel = NotificationDataModel.fromJson(
      Datas.notificationData,
    );
    loading.value = false;
    return notificationDataModel;
  }

  @override
  void onInit() {
    super.onInit();
    loadingData();
  }
}
