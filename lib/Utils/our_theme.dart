import 'package:flutter/material.dart';

class OurTheme {
  Color darkBrown = const Color(0xff151618);
  Color brown = const Color(0xff974928);
  Color lightBrown = const Color(0xffc8a27c);
  Color light = const Color(0xffc0c0c5);
  Color lilac = const Color(0xffa68fb6);
  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: lightBrown,
      primaryColor: brown,
      secondaryHeaderColor: darkBrown,
      hintColor: brown,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: light),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: lilac,
          ),
        ),
        prefixIconColor: brown,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkBrown,
        elevation: 0.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            darkBrown,
          ),
          elevation: MaterialStateProperty.all(
            7,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 20,
              color: Color(
                (0xff151618),
              ),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: darkBrown),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                40.0,
              ),
            ),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: light,
      ),
      iconTheme: IconThemeData(color: brown),
      primaryIconTheme: IconThemeData(color: brown),
    );
  }
}
