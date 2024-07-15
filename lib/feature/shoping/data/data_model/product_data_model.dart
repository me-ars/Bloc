
class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
final String  image;
  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image
  });

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
