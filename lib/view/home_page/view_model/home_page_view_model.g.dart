// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  late final _$timezonesAtom =
      Atom(name: '_HomePageViewModelBase.timezones', context: context);

  @override
  ObservableList<dynamic> get timezones {
    _$timezonesAtom.reportRead();
    return super.timezones;
  }

  @override
  set timezones(ObservableList<dynamic> value) {
    _$timezonesAtom.reportWrite(value, super.timezones, () {
      super.timezones = value;
    });
  }

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

  late final _$_HomePageViewModelBaseActionController =
      ActionController(name: '_HomePageViewModelBase', context: context);

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
timezones: ${timezones},
isLoading: ${isLoading}
    ''';
  }
}
