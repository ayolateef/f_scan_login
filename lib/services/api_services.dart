import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../utils/constants.dart';

class ApiService {
  Future<UserModel> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(Constants.loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'Email': email, 'Password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<Map<String, dynamic>> scanQRCode(String tagNum) async {
    final response = await http.get(Uri.parse('${Constants.scanUrl}$tagNum'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to scan QR code');
    }
  }
}
