import 'package:flutter_project_getx/core/db/local_database.dart';
import 'package:flutter_project_getx/modules/product/product_model_localdata.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  final dbSqflite = LocalDataBase();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    final data = await dbSqflite.getProducts();
    products.value = data;
  }

  void addProduct(String name, double price) async {
    await dbSqflite.insertProduct(Product(name: name, price: price));
    loadProducts();
  }

  void deleteProduct(int id) async {
    await dbSqflite.deleteProduct(id);
    loadProducts();
  }
}
