import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/extension/date_time_format_extension.dart';
import 'package:world_time/core/extension/string_extension.dart';
import 'package:world_time/product/widget/app_bars/custom_low_size_app_bar.dart';
import 'package:world_time/product/widget/loading_widget.dart';
import 'package:world_time/view/detail_page/view_model/detail_page_view_model.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final String path =
        (ModalRoute.of(context)!.settings.arguments as String);
    return BaseView<DetailPageViewModel>(
        viewModel: DetailPageViewModel(path: path),
        onPageBuilder: (context, model) {
          return Scaffold(
            appBar: CustomLowSizeAppBar(height: context.dynamicHeight(79)),
            body: Observer(builder: (_) {
              return Padding(
                padding: context.generalHomePageBodyPadding,
                child: model.isLoading ? const LoadingWidget(): _buildBody(context, model),
              );
            }),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setMainContext(context);
        });
  }

  Column _buildBody(BuildContext context, DetailPageViewModel model) {
    return Column(
      children: [
        context.emptyDynamicHeightSizedBox(50),
        _buildTimePart(context, model),
        context.emptyDynamicHeightSizedBox(28),
        _buildBoldText(model, context,model.districtTimeData?.timezone?.countryName()),
        context.emptyDynamicHeightSizedBox(5),
        _buildSubText(model, context, model.districtTimeData?.timezone?.continentName()),
        context.emptyDynamicHeightSizedBox(10),
      
        _buildSubText(model, context,  model.districtTimeData == null
              ? ""
              : ((model.districtTimeData!.datetime!.weekDayPlusYear!) +
                  ", " +
                  (model.districtTimeData!.abbreviation!)),),
        _buildSubText(model, context,model.districtTimeData?.datetime?.dayMonthFullDayNameDetailPage(context)),
      ],
    );
  }

  Text _buildBoldText(DetailPageViewModel model, BuildContext context,String? content) {
    return Text(
         content ?? "",
        textAlign: TextAlign.center,
        style: context.textTheme.subtitle2!
            .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      );
  }

  Text _buildSubText(DetailPageViewModel model, BuildContext context,String? content) {
    return Text(
        content ??
            "",
        style: context.textTheme.subtitle2,
        textAlign: TextAlign.center,
      );
  }

  Row _buildTimePart(BuildContext context, DetailPageViewModel model) {
    return Row(
        children: [
          _buildTimeBoxMethod(
              context,
              model,
              model.districtTimeData?.datetime?.hour),
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
              model.districtTimeData?.datetime?.minute
                  
                  ),
        ],
      );
  }

  Container _buildTimeBoxMethod(
      BuildContext context, DetailPageViewModel model, int? hourOrMinute) {
    return Container(
      child: Center(
          child: Text(
        hourOrMinute.toString().addingDigit,
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


