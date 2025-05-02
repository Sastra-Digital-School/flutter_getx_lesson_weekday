import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const MaterialColor primarySwatch =
      MaterialColor(_primarySwatchPrimaryValue, <int, Color>{
        50: Color(0xFFE8EEFB),
        100: Color(0xFFCAD7E7),
        200: Color(0xFFADBBCF),
        300: Color(0xFF8FA0B8),
        400: Color(0xFF788CA6),
        500: Color(_primarySwatchPrimaryValue),
        600: Color(0xFF536A84),
        700: Color(0xFF43566D),
        800: Color(0xFF344457),
        900: Color(0xFF222F3F),
      });

  static const int _primarySwatchPrimaryValue = 0xFF617895;

  static const MaterialColor secondarySwatch =
      MaterialColor(_secondarySwatchPrimaryValue, <int, Color>{
        50: Color(0xFFE4E7EE),
        100: Color(0xFFBBC2D6),
        200: Color(0xFF909BB9),
        300: Color(0xFF67759E),
        400: Color(0xFF485A8C),
        500: Color(_secondarySwatchPrimaryValue),
        600: Color(0xFF213973),
        700: Color(0xFF183068),
        800: Color(0xFF11275C),
        900: Color(0xFF061845),
      });
  static const int _secondarySwatchPrimaryValue = 0xFF273F7B;

  static final ColorScheme _lightScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: primarySwatch,
    backgroundColor: AppColors.background,
  ).copyWith(
    primary: primarySwatch[900],
    secondary: primarySwatch[500],
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    error: Colors.red.shade700,
    onError: Colors.white,
  );

  static final TextTheme _textTheme = GoogleFonts.leagueSpartanTextTheme()
      .copyWith(
        headlineLarge: GoogleFonts.leagueSpartan(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _lightScheme.onPrimary,
        ),
        titleLarge: GoogleFonts.leagueSpartan(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: _lightScheme.onSurface,
        ),
        labelLarge: GoogleFonts.leagueSpartan(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: _lightScheme.onPrimary,
        ),
        bodyMedium: GoogleFonts.leagueSpartan(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: _lightScheme.onSurface,
        ),
      );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightScheme,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: GoogleFonts.leagueSpartan().fontFamily,

    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.primarySwatch[900],
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
      toolbarHeight: 56,
    ),

    iconTheme: IconThemeData(color: _lightScheme.onPrimary),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 3,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.zero,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primarySwatch[100]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primarySwatch),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade600),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch[700],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      horizontalTitleGap: 12,
    ),

    shadowColor: AppColors.cardShadow,

    textTheme: _textTheme,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    backgroundColor: const Color(0xFF121212),
  ).copyWith(
    primary: primarySwatch[400],
    secondary: primarySwatch[200],
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    surface: const Color(0xFF1E1E1E),
    onSurface: Colors.white.withValues(alpha: .87),
    error: Colors.red.shade400,
    onError: Colors.black,
  );

  static final TextTheme _darkTextTheme = GoogleFonts.leagueSpartanTextTheme()
      .copyWith(
        headlineLarge: GoogleFonts.leagueSpartan(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _darkScheme.onPrimary,
        ),
        titleLarge: GoogleFonts.leagueSpartan(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: _darkScheme.onSurface,
        ),
        labelLarge: GoogleFonts.leagueSpartan(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: _darkScheme.onPrimary,
        ),
        bodyMedium: GoogleFonts.leagueSpartan(
          fontSize: 14,
          color: _darkScheme.onSurface,
        ),
      );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkScheme,
    scaffoldBackgroundColor: _darkScheme.onPrimary,
    fontFamily: GoogleFonts.leagueSpartan().fontFamily,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
    ),

    iconTheme: IconThemeData(color: _darkScheme.onSurface),

    cardTheme: CardThemeData(
      color: _darkScheme.surface,
      elevation: 2,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.zero,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primarySwatch[400]!),
      ),
      hintStyle: TextStyle(color: Colors.white60),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch[400],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: _darkScheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      horizontalTitleGap: 12,
    ),

    shadowColor: Colors.black45,
    textTheme: _darkTextTheme,
  );
}

class AppColors {
  AppColors._();

  static const background = Color(0xFFF5F7FA);
  static const Color cardShadow = Colors.black12;
  static const blur = Color(0xFFe1ecff);
  static var splash = const Color(0xFF063455);
  static var redColor = const Color.fromARGB(255, 175, 12, 0);
  static var green = Colors.green.shade800;
  static const white = Colors.white;
  static const darkColor = Color.fromRGBO(35, 52, 95, 1);
  static const darkColorLight = Color.fromRGBO(57, 77, 127, 1);
  static const darkIconColor = Color.fromRGBO(72, 113, 196, 1);
  static const greyBlue = Color(0xFF677A8A);
  static const grey = Color(0xFFCDCDCD);
  static const blackGrey = Color(0xFF323738);
}
