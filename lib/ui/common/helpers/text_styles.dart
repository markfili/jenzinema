import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static TextStyle title = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static TextStyle imdb = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static TextStyle genre = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );

  static TextStyle titleDetails = title.copyWith(
    fontSize: 20,
  );

  static TextStyle heading = title;
}
