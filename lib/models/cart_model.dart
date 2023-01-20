import 'package:shamo/models/product_model.dart';

class CartModel {
  final int? id;
  final ProductModel? product;
  int quantity;

  CartModel({
    this.id,
    this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity']);

  Map<String, dynamic> toJson() {
    return {'id': id, 'product': product?.toJson(), 'quantity': quantity};
  }

  double getTotalPrice() {
    double totalPrice = (product!.price! * quantity).toDouble();
    return totalPrice;
  }
}
