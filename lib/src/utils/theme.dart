import 'package:flutter/material.dart';

ThemeData customThemeData() {
  final ThemeData themeData = ThemeData.light();
  return themeData.copyWith(
      useMaterial3: true,
      dividerColor: Colors.grey,
      cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: themeData.colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          )));
}
