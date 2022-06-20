import 'package:flutter/material.dart';


abstract class BaseViewModel {
  BuildContext? mainContext;

  void setMainContext(BuildContext context2);
  void init();
}