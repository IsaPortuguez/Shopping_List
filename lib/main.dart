import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/screens/groceries_screen.dart';

final theme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 147, 229, 250),
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 42, 51, 59),
  ),
  // flutter pub add google_fonts
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: theme,
      home: GroceriesScreen(),
    );
  }
}
