import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocer_ease/provider/fruit_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_ease/routes/go_router.dart';

import 'provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'GrocerEase',
          theme: Provider.of<ThemeProvider>(context).themeData,
          routerConfig: router,
        );
      },
    );
  }
}
