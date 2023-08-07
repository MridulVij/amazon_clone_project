import 'dart:convert';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/views/home/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/error_handler.dart';
import '../models/auth_user_model.dart';
import 'package:http/http.dart' as http;

// Ip address setter
final String uri = 'http://192.168.1.4:5000';

class AuthService {
  // Sign Up User
  void signUpUser({
    required context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        address: '',
        email: email,
        name: name,
        password: password,
        token: '',
        type: '',
      );
      //
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      //
      httpErrorHandler(
          context: context,
          onSuccess: () {
            showwSnackBar(
                context, 'Account Created! Login with the same credentials');
          },
          response: res);
      // print(res.body);
    } catch (e) {
      showwSnackBar(context, 'Error: $e.toString()');
    }
  }

// sign in
  void signInUser({
    required context,
    required String email,
    required String password,
    // required String name,
  }) async {
    try {
      // removed user in sign in

      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(res.body);
      httpErrorHandler(
          context: context,
          onSuccess: () async {
            // showSnackBar(
            //     context, 'Account Created! Login with the same credentials');
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).seUser(res.body);
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, DashBoardUI.routeName, (route) => false);
          },
          response: res);
    } catch (e) {
      // showwSnackBar(context, 'Error: $e.toString()');
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.seUser(userRes.body);
      }
    } catch (e) {
      // showwSnackBar(context, e.toString());
    }
  }
}
