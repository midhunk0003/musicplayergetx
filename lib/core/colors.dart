import 'package:flutter/material.dart';

const bgColor = Color.fromARGB(255, 63, 58, 61);
const whiteColor = Color.fromARGB(255, 164, 163, 165);
const sliderColor = Color.fromARGB(255, 128, 90, 160);
const buttonColor = Color.fromARGB(255, 8, 177, 64);
const bgDarkColor = Color.fromARGB(255, 16, 17, 22);

LinearGradient createLinearGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 149, 115, 200), // Corresponds to the 0% color
      Color.fromARGB(255, 159, 134, 155), // Corresponds to the 50% color
      Color.fromARGB(255, 93, 53, 133), // Corresponds to the 100% color
    ],
    stops: [0.0, 0.5, 1.0], // Corresponding stops for the colors
  );
}
