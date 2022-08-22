import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme{
  static Color loginButtonColor = Colors.red;
  static Color registerButtonColor = Colors.red.shade300;
  static Color loginPageColor = Colors.yellow;

  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    canvasColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: Colors.white, 
      onPrimary: Colors.white70, 
      secondary: Colors.white70, 
      onSecondary: Colors.white70, 
      error: Colors.red, 
      onError: Colors.red, 
      background: Colors.cyan.shade100, 
      onBackground: Colors.white, 
      surface: Colors.cyan.shade50, 
      onSurface: Colors.white)
  );


  static ThemeData darkTheme(BuildContext context)=> ThemeData(
    canvasColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: Colors.black, 
      onPrimary: Colors.black87, 
      secondary: Colors.black87, 
      onSecondary: Colors.black87, 
      error: Colors.red, 
      onError: Colors.red, 
      background: Colors.cyan.shade100, 
      onBackground: Colors.black, 
      surface: Colors.cyan.shade50, 
      onSurface: Colors.black)
  );
}