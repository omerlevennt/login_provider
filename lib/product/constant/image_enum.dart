import 'package:flutter/material.dart';

enum ImageEnums { door }

extension ImageEnumExtension on ImageEnums {
  String get _toPath => "asset/images/ic_$name.png";

  Image get ToImage => Image.asset(_toPath);
}
