import 'dart:convert';

import 'package:shamo/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/shared/values.dart';

class ProductService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await http.get(
        Uri.parse("$baseUrl/categories"),
      );

      if (res.statusCode == 200) {
        return List<CategoryModel>.from(
          jsonDecode(res.body)['data']['data'].map(
            (category) => CategoryModel.fromJson(category),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
