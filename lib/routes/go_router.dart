import 'package:go_router/go_router.dart';
import 'package:grocer_ease/auth/auth_page.dart';
import 'package:grocer_ease/auth/login_or_signup.dart';
import 'package:grocer_ease/screens/homescreen.dart';
import 'package:grocer_ease/screens/sign_in.dart';
import 'package:grocer_ease/screens/sign_up.dart';

import '../screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/AuthPage',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/LoginOrRegister',
      builder: (context, state) => const LoginOrRegister(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUp(),
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
