import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/core/constants/enums/svg_icon_enum.dart';
import 'package:world_time/core/constants/regex/regex_constants.dart';
import 'package:world_time/core/extension/context_extension.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key,required this.controller});
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(44),
        width: context.dynamicWidth(309),

        child: TextFormField(
          inputFormatters: [FilteringTextInputFormatter.allow(RegexConstants.instance.nameRegExp)],
          controller: controller,
          decoration:  InputDecoration(prefixIcon: SvgEnums.search_icon.svgIcon(),label: Text("Arama",style: context.textTheme.subtitle1,)),
        ));
  }
}
