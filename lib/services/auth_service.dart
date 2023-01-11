import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shamo/models/form_model/sign_in_form_model.dart';
import 'package:shamo/models/form_model/sign_up_form_model.dart';

import '../models/user_model.dart';
import '../shared/values.dart';

class AuthService {
  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel formModel) async {
    try {
      const storage = FlutterSecureStorage();

      final res = await http.post(Uri.parse('$baseUrl/register'),
          body: formModel.toJson());
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));

        await storeCredentialToLocal(user);
        await storage.write(key: 'password', value: formModel.password);

        return user;
      } else {
        throw jsonDecode(res.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel formModel) async {
    try {
      const storage = FlutterSecureStorage();

      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: formModel.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));

        await storeCredentialToLocal(user);
        await storage.write(key: 'password', value: formModel.password);

        return user;
      } else {
        throw jsonDecode(res.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'not_authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
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

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();

    await storage.deleteAll();
  }
}
