// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:world_time/core/base/base_view_model/base_view_model.dart';
import 'package:world_time/core/init/network/network_manager.dart';
import 'package:world_time/product/model/user_model.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store, BaseViewModel {
  late TextEditingController searchFieldController;
  late User user;
  @observable
  bool isLoading = false;
  @observable
  bool isFilterActive = false;

  late StreamSubscription subscription;
  late Connectivity _connectivity;
  @observable
  bool isThereConnection = true;

  @override
  void init() async {
    changeLoadingState();
    user = User(name: "Özgür"); //Dummy user data.
    searchFieldController = TextEditingController();
    _connectivity = Connectivity();
    // Checking if user have internet connection or not
    await _connectivity.checkConnectivity().then(
        (ConnectivityResult isConnected) =>
            isConnected == ConnectivityResult.none
                ? isThereConnection = false
                : null);
    // thanks to the function below we'll know if user lost connection or connects after losing it.
    subscription = _connectivity.onConnectivityChanged.listen((event) async {
      isThereConnection = (event == ConnectivityResult.none) ? false : true;
      if (isThereConnection == true && timezones.isEmpty) {
        changeLoadingState();
        await getTimezone();
        changeLoadingState();
      }
    });

    await getTimezone();
    // Knowing each time when user type something to search field
    searchFieldController.addListener(() {
      filterTimezoneList();
      searchFieldController.text.isEmpty ? removeFilters() : null;
    });
    List<dynamic>? timezoneResponse = await compute(getTimezones, "");

    //creating list for all timezones
    timezoneResponse?.forEach((element) {
      timezones.add(element.toString());
    });
    changeLoadingState();
  }

  @action
  void setLanguage(Locale language, BuildContext context) {
    context.setLocale(language);
  }

  Future<void> getTimezone() async {
    List<dynamic>? timezoneResponse = await compute(getTimezones, "");
    timezoneResponse?.forEach((element) {
      timezones.add(element.toString());
    });
  }

  void onDispose() {
    searchFieldController.dispose();
    subscription.cancel();
  }

  static Future<List?> getTimezones(String _) async {
    return await NetworkManager.instance!.getTimeZones();
  }

  @override
  void setMainContext(BuildContext context) {
    this.mainContext = context;
  }

  @observable
  ObservableList<String> timezones = ObservableList.of([]);

  @observable
  ObservableList<String> filteredTimezones = ObservableList.of([]);

  @action
  void filterTimezoneList() {
    //if user typed someting in search field change filter status variable,clear the list first then add all items to the same list that contains what user wrote
    if (searchFieldController.text.isNotEmpty) {
      changeFilterState(true);
      filteredTimezones.clear();
      timezones.forEach((element) {
        if (element
            .toLowerCase()
            .contains(searchFieldController.text.toLowerCase())) {
          filteredTimezones.add(element);
        }
      });
    }
  }

  @action
  void removeFilters() {
    searchFieldController.clear();
    changeFilterState(false);
    filteredTimezones.clear();
  }

  @action
  void changeFilterState(bool value) {
    isFilterActive = value;
  }

  @action
  void changeLoadingState() {
    isLoading = !isLoading;
  }
}
