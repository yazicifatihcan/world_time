import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/product/widget/custom_app_bar.dart';
import 'package:world_time/product/widget/search_field.dart';
import 'package:world_time/view/home_page/view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
        viewModel: HomePageViewModel(),
        onPageBuilder: (context, model) {
          return Scaffold(
            appBar: CustomAppBar(height: context.dynamicHeight(221),searchBar: CustomSearchBar(controller: TextEditingController())),
            body: Column(
              children: [
              
              ],
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.mainContext;
        });
  }
}
