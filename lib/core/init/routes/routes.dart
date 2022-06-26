
import 'package:flutter/material.dart';
import 'package:world_time/core/constants/navigation/navigation_constants.dart';
import 'package:world_time/view/detail_page/view/detail_page_view.dart';
import 'package:world_time/view/home_page/view/home_page_view.dart';


final Map<String, WidgetBuilder> routes = {
  NavigationConstants.homePage: (context) => const HomePageView(),
  NavigationConstants.detailsPage:(context)=>  const DetailPageView()
  
};