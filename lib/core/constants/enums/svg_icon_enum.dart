// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgEnums {
  search_icon,
  
}

extension ImagePathsExtension on SvgEnums {
  String path() {
    return 'assets/icons/$name.svg';
  }

  SvgPicture svgIcon({Color? color}) {
    return SvgPicture.asset(path(),color: color,fit: BoxFit.scaleDown,);
  }
  
}