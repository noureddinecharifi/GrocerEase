import 'package:flutter/material.dart';
import 'package:grocer_ease/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/functions.dart';
import '../widgets/custom_input.dart';
import '../widgets/social_media.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            cover3,
            fit: BoxFit.cover,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomInput(
                                controller: emailController,
                                prefixIcon: Icons.person,
                                validator: (p0) {
                                  return null;
                                },
                                hintText: 'User Email',
                                obscure: false,
                              ),
                              CustomInput(
                                controller: passwordController,
                                prefixIcon: Icons.lock,
                                validator: (p0) {
                                  return null;
                                },
                                hintText: 'Password',
                                obscure: true,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    elevation: 0,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                                onPressed: login,
                                child: const Text('Sign in > '))),
                        const SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                            onTap: widget.onTap,
                            child: const Text('Create an account')),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: 100,
                              color: Colors.amber,
                            ),
                            const Text('OR'),
                            Container(
                              height: 1,
                              width: 100,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SocialIconsRow(
                          onFacebookTap: () {},
                          onAppleTap: () {},
                          onGoogleTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
