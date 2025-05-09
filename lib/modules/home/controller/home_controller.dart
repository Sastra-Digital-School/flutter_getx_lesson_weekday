import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/responsive/main_responsive.dart';
import 'package:flutter_project_getx/core/service/api_service.dart';
import 'package:flutter_project_getx/core/service/auth_service.dart';
import 'package:flutter_project_getx/core/service/local_service.dart';
import 'package:flutter_project_getx/core/string/string_con.dart';
import 'package:flutter_project_getx/modules/home/models/home_model.dart';
import 'package:flutter_project_getx/modules/home/models/product_model.dart';
import 'package:flutter_project_getx/modules/home/view/home_view_medium.dart';
import 'package:flutter_project_getx/modules/home/view/home_view_small.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/data/data.dart';

class HomeController extends GetxController {
  ApiService get apiService => ApiService(baseUrl: URL);

  final refreshController = RefreshController(initialRefresh: false).obs;

  Future<void> autoRefresh() async {
    refreshController.value.requestRefresh();
    lodaing.value = true;
    await loadingApiData();
    lodaing.value = false;
    refreshController.value.refreshCompleted();
  }

  Future<void> onRefresh() async {
    await loadingApiData();
    await loadingData();
    refreshController.value.refreshCompleted();
  }

  var _couter = 0.obs;

  get getCouter => _couter.value;

  void setCouter(value) => _couter.value = value;

  void increment() => _couter++;

  void decrement() => _couter.value <= 0 ? 0 : _couter--;

  List<HomeModel> homeModelList = [];

  var lodaing = true.obs;

  HomeModel homeModel = HomeModel();

  Future<void> loadingData() async {
    lodaing.value = true;

    // Simulate calling api
    await Future.delayed(Duration(seconds: 1));

    homeModel = HomeModel.fromJson(Datas.data);

    lodaing.value = false;
  }

  ProductModels productModels = ProductModels();

  Future<void> loadingApiData() async {
    // Calling api with api service
    productModels = await apiService.callApi<ProductModels>(
      endpoint: PRODUCT,
      body: {},
      fromJson: (data) => ProductModels.fromJson(data),
    );

    // Simple Calling api
    // var url = Uri.https('dummyjson.com', '/product/');
    // var response = await http.get(url);
    // var data = jsonDecode(response.body);
    // productModels = ProductModels.fromJson(data);
  }

  AuthService get authService => AuthService();

  var textEditingController = TextEditingController();
  var loading = false;

  final _textValue = ''.obs;

  void setTextValue(String value) async {
    await LocalStorageService.instance.setString('name', value);
    _textValue.value = LocalStorageService.instance.getString('name') ?? '';
  }

  get getTextValue => _textValue.value;

  final _token = ''.obs;

  void setToken(value) {
    _token.value = value;
  }

  get getToken => _token.value;

  @override
  void onInit() async {
    super.onInit();

    var token = await authService.getAccessToken();

    setToken(token);

    _textValue.value = LocalStorageService.instance.getString('name') ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      autoRefresh();
    });
  }

  @override
  void onClose() {
    refreshController.value.dispose();
    super.onClose();
  }
}

class HomeResponsive extends StatefulWidget {
  const HomeResponsive({super.key});

  @override
  State<HomeResponsive> createState() => _HomeResponsiveState();
}

class _HomeResponsiveState extends State<HomeResponsive> {
  @override
  Widget build(BuildContext context) {
    return MainResponsive(small: HomeView(), medium: HomeViewMedium());
  }
}
