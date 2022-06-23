import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/constants/enums/lottie_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/init/network/network_manager.dart';
import 'package:world_time/product/widget/app_bars/home_page_custom_app_bar.dart';
import 'package:world_time/product/widget/search_field.dart';
import 'package:world_time/view/home_page/components/custom_tile_design.dart';
import 'package:world_time/view/home_page/view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
        viewModel: HomePageViewModel(),
        onPageBuilder: (context, model) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: HomePageCustomAppBar(
              dateTime: DateTime.now(),
                height: context.dynamicHeight(221),
                searchBar:
                    CustomSearchBar(controller: TextEditingController())),
            body: Padding(
              padding: context.generalHomePageBodyPadding,
              child: Observer(builder: (_) {
                return Column(
                  children: [
                    model.isLoading ? LottieEnums.lottie_loading.toLottieAsset(height: context.dynamicHeight(20)) : context.emptyDynamicHeightSizedBox(20),
                    SizedBox(
                      height: context.dynamicHeight(502),
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return context.emptyDynamicHeightSizedBox(10);
                          },
                          itemCount: model.timezones.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {},
                              child: CustomTileDesign(
                                index: index,
                                title: model.timezones[index],
                              ),
                            );
                          }),
                    )
                  ],
                );
              }),
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.mainContext;
        });
  }
}
