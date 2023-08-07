import 'package:amazon_clone/views/auth/sign_up.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../widgets/custom_button.dart';

class SignIn extends StatefulWidget {
  static const String routeName = '/sign_in';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final AuthService authService = AuthService();

  void signInUser() {
    authService.signInUser(
      context: context,
      email: email.text,
      password: pass.text,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 100),
        const Text('Sign In Page'),
        TextFormField(
          controller: email,
        ),
        TextFormField(
          controller: pass,
        ),
        CustomButton(
          onTap: () {
            signInUser();
          },
          text: 'Sign In',
        ),
        SizedBox(
          height: 400,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text('Create Account!'))
      ]),
    );
  }
}
