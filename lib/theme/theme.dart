
import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.amber,
    primary: Colors.red,
  ),
);
