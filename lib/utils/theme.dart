import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(titleTextStyle: GoogleFonts.poppins()),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      primary: const Color(0xFF45B8EB),
      seedColor: const Color(0xFF031022),
      onBackground: const Color(0xFF031022),
      secondary: const Color(0xFFF64735),
      background: const Color(0xFFF8F8F8),
    ),

    
    textTheme: TextTheme(
      
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
      headlineLarge: GoogleFonts.poppins(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
      
      bodySmall: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
    ));


ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      primary: const Color(0xFF45B8EB),
      seedColor: const Color(0xFF031022),
      onBackground: const Color(0xFF031022),
      secondary: const Color(0xFFF64735),
      background: Colors.black,
    ),


    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
      bodySmall: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
    ));
