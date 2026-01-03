import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Slate-like colors
  static const primary = Color(0xFF2563EB); // Blue-600
  static const backgroundLight = Color(0xFFF8FAFC); // Slate-50
  static const surfaceLight = Color(0xFFFFFFFF);
  static const textPrimaryLight = Color(0xFF0F172A); // Slate-900
  static const textSecondaryLight = Color(0xFF64748B); // Slate-500
  static const borderLight = Color(0xFFE2E8F0); // Slate-200

  static const backgroundDark = Color(0xFF0F172A); // Slate-900
  static const surfaceDark = Color(0xFF1E293B); // Slate-800
  static const textPrimaryDark = Color(0xFFF8FAFC); // Slate-50
  static const textSecondaryDark = Color(0xFF94A3B8); // Slate-400
  static const borderDark = Color(0xFF334155); // Slate-700

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: primary,
      surface: surfaceLight,
      onSurface: textPrimaryLight,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: textPrimaryLight,
      displayColor: textPrimaryLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      labelStyle: const TextStyle(color: textSecondaryLight),
      hintStyle: const TextStyle(color: textSecondaryLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: primary,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(color: Colors.white);
        }
        return const IconThemeData(color: textSecondaryLight);
      }),
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(color: primary, fontWeight: FontWeight.bold);
        }
        return const TextStyle(color: textSecondaryLight);
      }),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      surface: surfaceDark,
      onSurface: textPrimaryDark,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
      bodyColor: textPrimaryDark,
      displayColor: textPrimaryDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      labelStyle: const TextStyle(color: textSecondaryDark),
      hintStyle: const TextStyle(color: textSecondaryDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: primary,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(color: Colors.white);
        }
        return const IconThemeData(color: textSecondaryDark);
      }),
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(color: primary, fontWeight: FontWeight.bold);
        }
        return const TextStyle(color: textSecondaryDark);
      }),
    ),
  );
}
