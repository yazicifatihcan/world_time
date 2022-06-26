import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:world_time/core/base/base_view_model/base_view_model.dart';
import 'package:world_time/core/init/network/network_manager.dart';
import 'package:world_time/product/model/district_time_model.dart';
part 'detail_page_view_model.g.dart';

class DetailPageViewModel = _DetailPageViewModelBase with _$DetailPageViewModel;

abstract class _DetailPageViewModelBase with Store, BaseViewModel {
  DistrictTimeData? districtTimeData;
  String path;
  _DetailPageViewModelBase({required this.path});

  @override
  void init() async{
    changeLoading();
    districtTimeData=await compute(NetworkManager.instance!.getDistrictTimeData,path);
    changeLoading();
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void setMainContext(BuildContext context) {
    this.mainContext = context;
  }
}
