import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF004E63);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryFixedDim = Color(0xFF86D0EF);
  static const Color primaryContainer = Color(0xFF006782);
  static const Color onPrimaryContainer = Color(0xFF9fe2ff);
  static const Color surfaceTint = Color(0xFF006782);
  static const Color background = Color(0xFFF7F9FF);
  static const Color onPrimaryFixed = Color(0xFF001F2B);
  
  static const Color surfaceVariant = Color(0xFFF1F4F9);
  static const Color surfaceDim = Color(0xFFD7DAE0);
  static const Color warningAmber = Color(0xFFF57C00);
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);
  
  static const Color secondary = Color(0xFF4C626B);
  static const Color secondaryContainer = Color(0xFFCCe3ee);
  static const Color onSecondaryContainer = Color(0xFF50666F);
  
  static const Color outline = Color(0xFF6F787D);
  static const Color outlineVariant = Color(0xFFBFC8CD);
  static const Color onSurface = Color(0xFF181C20);
  static const Color onSurfaceVariant = Color(0xFF3F484C);
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        onPrimary: onPrimary,
        background: background,
        surface: background,
      ),
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.hankenGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.64, // -0.02em
          height: 40 / 32,
        ),
        headlineMedium: GoogleFonts.hankenGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 32 / 24,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 28 / 20,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          height: 24 / 16,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 24 / 16,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 20 / 14,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 20 / 14,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 16 / 12,
        ),
      ),
    );
  }
}
