import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:world_time/core/base/base_view_model/base_view_model.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store,BaseViewModel {


  @override
  void init(){}

  @override
  void setMainContext(BuildContext context) {
    this.mainContext = context;
  }
  
}