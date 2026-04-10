import 'package:flutter/material.dart';

class Pallete {
  static const cardColor = Color.fromRGBO(30, 30, 30, 1);
  static const greenColor = Colors.green;
  static const subtitleText = Color(0xffa7a7a7);
  static const inactiveBottomBarItemColor = Color(0xffababab);

  //colours for theme
  static const Color lightTheme = Color.fromARGB(255, 255, 255, 255);
  static const Color darkTheme = Color.fromRGBO(29, 10, 115, 0.705);

  static const Color backgroundColor = Color.fromARGB(255, 15, 0, 100);
  static const Color fromBorder = Color.fromRGBO(255, 208, 0, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color errorColor = Colors.redAccent;
  static const Color transparentColor = Colors.transparent;

  static const Color inactiveSeekColor = Colors.white38;
}

class GradientBackground {
  static const LinearGradient mainGradient = LinearGradient(
    colors: [Pallete.lightTheme, Color.fromARGB(255, 255, 255, 255)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightBackground = LinearGradient(
    colors: [Pallete.backgroundColor, Pallete.lightTheme],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
