import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:world_time/core/base/base_view_model/base_view_model.dart';
import 'package:world_time/core/init/network/network_manager.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store, BaseViewModel {
  
  @override
  void init() async {
    isLoading = true;
    List<dynamic> timezoneResponse =
        await NetworkManager.instance!.getTimeZones();
      timezoneResponse.forEach((element) {
      timezones.add(element.toString());
    });
    isLoading = false;
  }

  @override
  void setMainContext(BuildContext context) {
    this.mainContext = context;
  }

  @observable
  ObservableList timezones = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @action
  void changeLoadingState() {
    isLoading = !isLoading;
  }
}
