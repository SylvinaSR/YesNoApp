import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 249, 145, 251);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({ this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1, 'Colors must be between 0 and ${_colorTheme.length -1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, //Usar estilo de Material3
      colorSchemeSeed: _colorTheme[selectedColor],
    );
  }
}
