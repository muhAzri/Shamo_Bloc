import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/models/form_model/checkout_form_model.dart';
import 'package:shamo/shared/values.dart';

class TransactionService {
  Future checkout(CheckoutFormModel checkoutFormModel) async {
    try {
      final token = await getToken();

      

      final res = await http.post(
        Uri.parse(
          "$baseUrl/checkout",
        ),
        headers: {'Accept': 'application/json', 'Authorization': token},
        body: jsonEncode(checkoutFormModel.toJson()),
      );

      if (res.statusCode == 200) {
        return true;
      }

      return false;
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
