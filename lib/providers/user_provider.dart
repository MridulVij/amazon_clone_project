import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    address: '',
    email: '',
    password: '',
    name: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  void seUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
