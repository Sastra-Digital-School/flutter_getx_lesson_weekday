import 'package:flutter/material.dart';
import 'package:flutter_project_getx/modules/product/product_controller.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  final int id;
  final int index;
  ItemDetail({super.key, required this.id, required this.index});

  final ProductController controller = Get.put(ProductController());
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text(id == 0 ? 'Popular' : 'Latest')),
        body: _buildBody,
      ),
    );
  }

  get _buildBody {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                autocorrect: false,
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
    );
  }
}
