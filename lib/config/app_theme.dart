
import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 62, 48, 190);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.red,
  Color.fromARGB(255, 0, 214, 252),
  Colors.blue,
  Color.fromARGB(255, 255, 251, 0),
  Color.fromARGB(255, 244, 3, 244),
  Color.fromARGB(255, 0, 255, 106),
];

class AppTheme {

  final int selectedColor;

  AppTheme({ this.selectedColor = 0 })
  : assert (selectedColor>=0 && selectedColor <= _colorThemes.length-1, 
    'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  } 
}