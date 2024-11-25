import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.openSans(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

IconThemeData iconTheme() {
  return const IconThemeData(color: Colors.white, size: 28);
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    iconTheme: iconTheme(),
    titleTextStyle: GoogleFonts.nanumGothic(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

// 5
BottomNavigationBarThemeData bottomNavigatorTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.transparent,
    showUnselectedLabels: false,
    showSelectedLabels: false,
  );
}

BottomAppBarTheme bottomAppBarTheme() {
  return const BottomAppBarTheme(
    surfaceTintColor: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 16),
    color: Colors.transparent,
    shape: CircularNotchedRectangle(),
  );
}

InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
  focusColor: Colors.white,
  hoverColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
);

TextSelectionThemeData textSelectionThemeData = const TextSelectionThemeData(
  cursorColor: Color(0xff86C3D8),
  selectionColor: Color(0xff86C3D8),
  selectionHandleColor: Color(0xff86C3D8),
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      color: Colors.white,
    ),
    backgroundColor: const Color(0xff86C3D8),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(64),
    ),
  ),
);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xffc6ecf9),
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigatorTheme(),
    bottomAppBarTheme: bottomAppBarTheme(),
    primarySwatch: Colors.orange,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: textSelectionThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
  );
}
