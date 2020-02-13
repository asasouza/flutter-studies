import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import './exception_http.dart';

class Auth extends ChangeNotifier {
  final _storageKey = 'userData';
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _logoutTimer;

  bool get isAuthenticated {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
    String email,
    String password,
    String urlSegment,
  ) {
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
      final body = json.decode(response.body);
      if (body['error'] != null) {
        throw HttpException(body['error']['message']);
      }

      _token = body['idToken'];
      _userId = body['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            body['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      SharedPreferences.getInstance().then((storage) {
        storage.setString(
          _storageKey,
          json.encode({
            'userId': _userId,
            'token': _token,
            'expiryDate': _expiryDate.toIso8601String(),
          }),
        );
      });
      notifyListeners();
    });
  }

  Future<void> signup(String email, String password) {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() async {
    this._token = null;
    this._userId = null;
    this._expiryDate = null;
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
      _logoutTimer = null;
    }
    final storage = await SharedPreferences.getInstance();
    storage.clear();
    notifyListeners();
  }

  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
    }
    final timer = _expiryDate.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(
      Duration(seconds: timer),
      logout,
    );
  }

  Future<bool> autoLogin() async {
    final storage = await SharedPreferences.getInstance();
    if (!storage.containsKey(_storageKey)) {
      return false;
    }
    final userData =
        json.decode(storage.getString(_storageKey)) as Map<String, Object>;
    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    
    _token = userData['token'];
    _userId = userData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }
}
