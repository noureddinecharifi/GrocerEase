import 'package:flutter/material.dart';
import 'package:grocer_ease/utils/constants.dart';

import '../widgets/custom_input.dart';
import '../widgets/social_media.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  const SignUp({super.key, this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            cover2,
            fit: BoxFit.cover,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              // height: 550.h,
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
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomInput(
                                controller: usernameController,
                                prefixIcon: Icons.person,
                                validator: (p0) {
                                  return null;
                                },
                                hintText: 'Username',
                                obscure: false,
                              ),
                              CustomInput(
                                controller: emailController,
                                prefixIcon: Icons.person,
                                validator: (p0) {
                                  return null;
                                },
                                hintText: 'Email',
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
                              CustomInput(
                                controller: confirmController,
                                prefixIcon: Icons.lock,
                                validator: (p0) {
                                  return null;
                                },
                                hintText: 'Password',
                                obscure: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                                onPressed: () {},
                                child: const Text('Sign up > '))),
                        const SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                            onTap: widget.onTap,
                            child: const Text('Already have an account')),
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
