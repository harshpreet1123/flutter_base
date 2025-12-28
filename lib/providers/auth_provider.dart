import 'package:flutter/material.dart';
import '../utils/secure_storage.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _checkToken();
  }

  Future<void> _checkToken() async {
    final token = await SecureStorage.getToken();
    if (token != null) {
      _isAuthenticated = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    
    // Simulate API
    await Future.delayed(const Duration(seconds: 1));
    await SecureStorage.saveToken("mock_token");
    
    _isAuthenticated = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    _isAuthenticated = false;
    notifyListeners();
  }
}
