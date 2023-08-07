import 'package:amazon_clone/services/auth_service.dart';
import 'package:amazon_clone/views/auth/sign_in.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/sign_up';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: email.text,
        password: pass.text,
        name: name.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('Sign Up Page'),
                TextFormField(
                  controller: name,
                ),
                TextFormField(
                  controller: email,
                ),
                TextFormField(
                  controller: pass,
                ),
                //ElevatedButton(onPressed: () {}, child: Text('SignUp')),
                CustomButton(
                  onTap: () {
                    //
                    signUpUser();
                  },
                  text: 'Sign Up',
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text('Already Have an Account?'))
              ],
            )),
      ]),
    );
  }
}
