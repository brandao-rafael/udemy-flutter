import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCk-ovKfq1QJUxkHZgI4KS1yATkJdIFipA';
  
  Future<void> signup({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(jsonDecode(response.body));
  }
}

// https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]