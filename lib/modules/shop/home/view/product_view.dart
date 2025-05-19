import 'package:flutter/material.dart';
import 'package:flutter_project_getx/modules/shop/product/product_controller.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Manager")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final price = double.tryParse(priceController.text) ?? 0;
                    controller.addProduct(name, price);
                    nameController.clear();
                    priceController.clear();
                  },
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ListTile(
                    title: Text('${product.name} - \$${product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteProduct(product.id!),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
