import 'package:flutter/material.dart';

import '../screens/sign_in.dart';
import '../screens/sign_up.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showSignUpPage = true;

  void togglePages() {
    setState(() {
      showSignUpPage = !showSignUpPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignUpPage) {
      return SignUp(
        onTap: togglePages,
      );
    } else {
      return SignIn(
        onTap: togglePages,
      );
    }
  }
}
