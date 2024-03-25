import 'package:go_router/go_router.dart';
import 'package:grocer_ease/screens/homescreen.dart';

import '../screens/onboarding_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/homePage',
      builder: (context, state) => const HomeScreen(
        initialTabIndex: 0,
      ),
    ), 
    // GoRoute(
    //   path: '/signin',
    //   builder: (context, state) =>  const SignIn(),
    // ),
    // GoRoute(
    //   path: '/signup',
    //   builder: (context, state) => const SignUp(),
    // ),
  ],
);
