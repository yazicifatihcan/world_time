// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomePageViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFilterActiveAtom =
      Atom(name: '_HomePageViewModelBase.isFilterActive', context: context);

  @override
  bool get isFilterActive {
    _$isFilterActiveAtom.reportRead();
    return super.isFilterActive;
  }

  @override
  set isFilterActive(bool value) {
    _$isFilterActiveAtom.reportWrite(value, super.isFilterActive, () {
      super.isFilterActive = value;
    });
  }

  late final _$isThereConnectionAtom =
      Atom(name: '_HomePageViewModelBase.isThereConnection', context: context);

  @override
  bool get isThereConnection {
    _$isThereConnectionAtom.reportRead();
    return super.isThereConnection;
  }

  @override
  set isThereConnection(bool value) {
    _$isThereConnectionAtom.reportWrite(value, super.isThereConnection, () {
      super.isThereConnection = value;
    });
  }

  late final _$timezonesAtom =
      Atom(name: '_HomePageViewModelBase.timezones', context: context);

  @override
  ObservableList<String> get timezones {
    _$timezonesAtom.reportRead();
    return super.timezones;
  }

  @override
  set timezones(ObservableList<String> value) {
    _$timezonesAtom.reportWrite(value, super.timezones, () {
      super.timezones = value;
    });
  }

  late final _$filteredTimezonesAtom =
      Atom(name: '_HomePageViewModelBase.filteredTimezones', context: context);

  @override
  ObservableList<String> get filteredTimezones {
    _$filteredTimezonesAtom.reportRead();
    return super.filteredTimezones;
  }

  @override
  set filteredTimezones(ObservableList<String> value) {
    _$filteredTimezonesAtom.reportWrite(value, super.filteredTimezones, () {
      super.filteredTimezones = value;
    });
  }

  late final _$_HomePageViewModelBaseActionController =
      ActionController(name: '_HomePageViewModelBase', context: context);

  @override
  void setLanguage(Locale language, BuildContext context) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.setLanguage');
    try {
      return super.setLanguage(language, context);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterTimezoneList() {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.filterTimezoneList');
    try {
      return super.filterTimezoneList();
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFilters() {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.removeFilters');
    try {
      return super.removeFilters();
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilterState(bool value) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.changeFilterState');
    try {
      return super.changeFilterState(value);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingState() {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.changeLoadingState');
    try {
      return super.changeLoadingState();
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFilterActive: ${isFilterActive},
isThereConnection: ${isThereConnection},
timezones: ${timezones},
filteredTimezones: ${filteredTimezones}
    ''';
  }
}
