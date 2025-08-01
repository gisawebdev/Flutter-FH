import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.amber,
  Colors.blue,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.yellow,
  Colors.purple,
  Colors.red,
  Colors.green,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
    : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: false),
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkmode: isDarkmode ?? this.isDarkmode,
  );
}
