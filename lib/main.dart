import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocer_ease/screens/homescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GrocerEase',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const HomeScreen());
  }
}
