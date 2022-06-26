import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/constants/enums/lottie_enums.dart';
import 'package:world_time/core/constants/enums/svg_icon_enum.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/init/language/language_init.dart';
import 'package:world_time/product/widget/app_bars/home_page_custom_app_bar.dart';
import 'package:world_time/product/widget/loading_widget.dart';
import 'package:world_time/product/widget/no_connection_widget.dart';
import 'package:world_time/product/widget/search_field.dart';
import 'package:world_time/view/home_page/components/custom_tile_design.dart';
import 'package:world_time/view/home_page/view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
        onDispose: HomePageViewModel().onDispose,
        viewModel: HomePageViewModel(),
        onPageBuilder: (context, model) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context, model),
            body: _buildWholeBody(context, model),
          );
        },
        onModelReady: (model) {
          model.init();
          model.mainContext;
        });
  }

  Observer _buildWholeBody(BuildContext context, HomePageViewModel model) {
    return Observer(builder: (_) {
      return Padding(
        padding: context.generalHomePageBodyPadding,
        child: model.isThereConnection ?(model.isLoading
            ? const LoadingWidget()
            : _buildColumnBody(model, context)): const NoConnectionWidget(),
      );
    });
  }

  HomePageCustomAppBar _buildAppBar(
      BuildContext context, HomePageViewModel model) {
    return HomePageCustomAppBar(
        userName: model.user.name,
        dateTime: DateTime.now(),
        height: context.dynamicHeight(221),
        searchBar: Observer(builder: (_) {
          return CustomSearchBar(
            onRemove: model.removeFilters,
            onChanged: model.filterTimezoneList,
            controller: model.searchFieldController,
            isFilterActive: model.isFilterActive,
          );
        }));
  }

  Column _buildColumnBody(HomePageViewModel model, BuildContext context) {
    return Column(
      children: [
        context.emptyDynamicHeightSizedBox(20),
        _buildTimeZoneListView(context, model,
            model.isFilterActive ? model.filteredTimezones : model.timezones),
        context.emptyDynamicHeightSizedBox(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLanguageButton(
                model, context, LanguageInit().supportedLocales[0]),
            context.emptyDynamicWidthSizedBox(10),
            _buildLanguageButton(
                model, context, LanguageInit().supportedLocales[1]),
          ],
        )
      ],
    );
  }

  InkWell _buildLanguageButton(
      HomePageViewModel model, BuildContext context, Locale locale) {
    return InkWell(
        onTap: () => model.setLanguage(locale, context),
        child: Text(
          locale.languageCode.toUpperCase(),
          style: context.textTheme.subtitle2!.copyWith(
              color: context.locale.languageCode == locale.languageCode
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.secondary),
        ));
  }

  SizedBox _buildTimeZoneListView(
      BuildContext context, HomePageViewModel model, List timezoneList) {
    return SizedBox(
      height: context.dynamicHeight(502),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return context.emptyDynamicHeightSizedBox(10);
          },
          itemCount: timezoneList.length,
          itemBuilder: (context, index) {
            return CustomTileDesign(
              index: index,
              title: timezoneList[index],
            );
          }),
    );
  }
}



