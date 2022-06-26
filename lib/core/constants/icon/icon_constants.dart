import 'package:flutter/material.dart';

class IconConstants {
  static IconConstants? _instace;

  static IconConstants get instance => _instace ??= IconConstants._init();

  IconConstants._init();

  IconData arrowBack = Icons.chevron_left_outlined;
  IconData removeFilter = Icons.cancel;
  IconData arrowRight = Icons.chevron_right_outlined;
}
