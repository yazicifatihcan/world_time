import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/constants/enums/lottie_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/extension/date_time_format_extension.dart';
import 'package:world_time/core/extension/string_extension.dart';
import 'package:world_time/product/widget/app_bars/custom_low_size_app_bar.dart';
import 'package:world_time/view/detail_page/view_model/detail_page_view_model.dart';

class DetailPageView extends StatelessWidget {
  DetailPageView({super.key, required this.path});
  String path;
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailPageViewModel>(
        viewModel: DetailPageViewModel(path: path),
        onPageBuilder: (context, model) {
          return Scaffold(
            appBar: CustomLowSizeAppBar(height: context.dynamicHeight(79)),
            body: Padding(
              padding: context.generalHomePageBodyPadding,
              child: _buildBody(context, model),
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setMainContext(context);
        });
  }

  Observer _buildBody(BuildContext context, DetailPageViewModel model) {
    return (Observer(builder: (_) {
      // print(model.districtTimeData!.datetime!.hour);
      return Column(
        children: [
          model.isLoading
              ? LottieEnums.lottie_loading
                  .toLottieAsset(height: context.dynamicHeight(50))
              : context.emptyDynamicHeightSizedBox(50),
          Row(
            children: [
              _buildTimeBoxMethod(
                  context,
                  model,
                  model.districtTimeData?.datetime?.hour.toString().addingDigit
                      .toString()
                      .addingDigit),
              context.emptyDynamicWidthSizedBox(10),
              Column(
                children: [
                  _buildDotMethod(context),
                  context.emptyDynamicHeightSizedBox(16),
                  _buildDotMethod(context),
                ],
              ),
              context.emptyDynamicWidthSizedBox(10),
              _buildTimeBoxMethod(
                  context,
                  model,
                  model.districtTimeData?.datetime?.minute.toString().addingDigit
                      .toString()
                      .addingDigit),
            ],
          ),
          context.emptyDynamicHeightSizedBox(28),
          Text(
            model.districtTimeData?.timezone?.countryName() ?? 
            "",
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle2!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          context.emptyDynamicHeightSizedBox(5),
          Text(
            model.districtTimeData?.timezone?.continentName() ?? 
            "",
            style: context.textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          context.emptyDynamicHeightSizedBox(10),
          Text(
            model.districtTimeData==null ?"": ((model.districtTimeData!.datetime!.weekDayPlusYear!) +", "+ (model.districtTimeData!.abbreviation!)),
            style: context.textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          Text(
            model.districtTimeData?.datetime?.dayMonthFullDayNameDetailPage() ?? 
            "",
            style: context.textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }));
  }

  Container _buildTimeBoxMethod(
      BuildContext context, DetailPageViewModel model, String? hourOrMinute) {
    return Container(
      child: Center(
          child: Text(
        hourOrMinute ?? "",
        style: context.textTheme.headline1!.copyWith(fontSize: 79),
      )),
      width: context.dynamicWidth(140),
      height: context.dynamicHeight(140),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.circular(14),
          border:
              Border.all(color: context.theme.colorScheme.onSurface, width: 2)),
    );
  }

  Container _buildDotMethod(BuildContext context) => Container(
        width: context.dynamicWidth(9),
        height: context.dynamicHeight(9),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colorScheme.primary,
        ),
      );
}
