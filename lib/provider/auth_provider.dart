import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_services.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? token;
  bool loginLoading = false;
  bool scanLoading = false;
  String scanMessage = '';

  Future<void> loginUser(String email, String password) async {
    loginLoading = true;
    notifyListeners();

    try {
      UserModel user = await _apiService.loginUser(email, password);
      token = user.token;
    } catch (e) {
      print('Error logging in: $e');
    } finally {
      loginLoading = false;
      notifyListeners();
    }
  }

  Future<void> scanQRCode(String tagNum) async {
    scanLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.scanQRCode(tagNum);
      if (data['IsSuccess'] == true) {
        scanMessage = 'QR Code data: ${data['Data']}';
      } else {
        scanMessage = data['Message'] ?? 'Scan failed';
      }
    } catch (e) {
      scanMessage = 'Error scanning QR code: $e';
    } finally {
      scanLoading = false;
      notifyListeners();
    }
  }
}
