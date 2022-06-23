import 'package:flutter/material.dart';
import 'package:world_time/core/base/base_view/base_widget.dart';
import 'package:world_time/core/constants/enums/image_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/product/widget/app_bars/custom_low_size_app_bar.dart';
import 'package:world_time/view/detail_page/view_model/detail_page_view_model.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailPageViewModel>(
        viewModel: DetailPageViewModel(),
        onPageBuilder: (context, model) {
          return Scaffold(
            appBar: CustomLowSizeAppBar(height: context.dynamicHeight(79)),
            body: Padding(padding: context.generalHomePageBodyPadding,
            child: _buildBody(context),
            
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setMainContext(context);
        });
  }

  Column _buildBody(BuildContext context) {
    return Column(
            children: [
              context.emptyDynamicHeightSizedBox(50),
              Row(
                children: [
                  _buildTimeBoxMethod(context),
                  context.emptyDynamicWidthSizedBox(10),
                  Column(
                    children: [
                      _buildDotMethod(context),
                      context.emptyDynamicHeightSizedBox(16),
                      _buildDotMethod(context),
                    ],
                  ),
                  context.emptyDynamicWidthSizedBox(10),
                  _buildTimeBoxMethod(context),
                ],
              ),
              context.emptyDynamicHeightSizedBox(28),
              Text("Abidjan",style: context.textTheme.subtitle2!.copyWith(fontSize: 20,fontWeight: FontWeight.w600),),
              context.emptyDynamicHeightSizedBox(5),
              Text("Africa",style: context.textTheme.subtitle2,),
              context.emptyDynamicHeightSizedBox(10),
              Text("Çarşamba,  GMT +01:00",style: context.textTheme.subtitle2,),
              Text("Haziran 8, 2022",style: context.textTheme.subtitle2,),
            ],
          );
  }

  Container _buildTimeBoxMethod(BuildContext context) {
    return Container(
                    child: Center(child: Text("13",style: context.textTheme.headline1!.copyWith(fontSize: 79),)),
                    width: context.dynamicWidth(140),
                    height: context.dynamicHeight(140),
                    decoration: BoxDecoration(color: context.theme.colorScheme.onSecondaryContainer,borderRadius: BorderRadius.circular(14),border: Border.all(color:context.theme.colorScheme.onSurface,width: 2)),
                  );
  }

  Container _buildDotMethod(BuildContext context) => Container(width: context.dynamicWidth(9),height:context.dynamicHeight(9),decoration: BoxDecoration(shape: BoxShape.circle,color: context.theme.colorScheme.primary,),);


}
