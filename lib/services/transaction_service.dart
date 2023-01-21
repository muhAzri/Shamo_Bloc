import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/shared/values.dart';

import '../models/cart_model.dart';

class TransactionService {
  Future checkout(List<CartModel> carts, double totalPrice) async {
    try {
      final token = await getToken();

      final body = jsonEncode(
        {
          'address': 'Kota Cimahi',
          'items': carts
              .map(
                (cart) => {
                  'id': cart.product!.id,
                  'quantity': cart.quantity,
                },
              )
              .toList(),
          'status': 'PENDING',
          'total_price': totalPrice,
          'shipping_price': 100,
        },
      );

      final res = await http.post(
        Uri.parse(
          "$baseUrl/checkout",
        ),
        headers: {'Accept': 'application/json', 'Authorization': token},
        body: body,
      );

      if (res.statusCode == 200) {
        return true;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }

    return token;
  }
}
