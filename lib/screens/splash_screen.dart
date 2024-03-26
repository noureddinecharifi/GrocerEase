import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocer_ease/utils/constants.dart';

import '../widgets/social_media.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(
      {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            cover1,
            fit: BoxFit.cover,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 225.h,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.background,
                                  elevation: 0,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                              onPressed: ()=> context.go('/LoginOrRegister'),
                              child: const Text('Create an account > '))),
                      GestureDetector(
                          onTap: ()=> context.go('/LoginOrRegister'),
                          child: const Text('Already have an account')),
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
          )
        ],
      ),
    );
  }
}
