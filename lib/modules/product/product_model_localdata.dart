class Product {
  int? id;
  String name;
  double price;

  Product({this.id, required this.name, required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(id: map['id'], name: map['name'], price: map['price']);
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'price': price};
}
