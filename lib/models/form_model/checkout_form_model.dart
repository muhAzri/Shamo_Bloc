
class ItemModel {
  final int id;
  final int quantity;

  ItemModel({required this.id, required this.quantity});

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}

class CheckoutFormModel {
  final String address;
  final List<ItemModel> items;
  final String status;
  final double totalPrice;
  final double shippingPrice;

  CheckoutFormModel({
    this.address = 'Kota Bogor',
    required this.items,
    this.status = 'PENDING',
    required this.totalPrice,
    this.shippingPrice = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'items': items.map((item) => item.tojson()).toList(),
      'status': status,
      'total_price': totalPrice,
      'shipping_price': shippingPrice
    };
  }
}
