import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:world_time/core/base/base_view_model/base_view_model.dart';
part 'detail_page_view_model.g.dart';

class DetailPageViewModel = _DetailPageViewModelBase with _$DetailPageViewModel;

abstract class _DetailPageViewModelBase with Store,BaseViewModel {
  
  
  @override
  void init(){}

  @override
  void setMainContext(BuildContext context) {
    this.mainContext = context;
  }

}