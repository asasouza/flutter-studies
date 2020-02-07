import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(String email, String password, String urlSegment) {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCfwzOyTVsib3PASi6qtR88C7wNNynxz4k';
    return http
        .post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    )
        .then((response) {
      print(response.body);
    });
  }

  Future<void> signup(String email, String password) {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
