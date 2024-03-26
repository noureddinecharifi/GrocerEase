import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocer_ease/auth/login_or_signup.dart';
import 'package:grocer_ease/screens/homescreen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen(initialTabIndex: 0,);
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
