import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/core/constants/enums/svg_icon_enum.dart';
import 'package:world_time/core/constants/icon/icon_constants.dart';
import 'package:world_time/core/constants/regex/regex_constants.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/product/init/lang/locale_keys.g.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key,
      required this.controller,
      this.isFilterActive = false,
      this.onChanged,this.onRemove});
  final TextEditingController controller;
  final bool isFilterActive;
  final VoidCallback? onChanged;
  final VoidCallback? onRemove;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(44),
        width: context.dynamicWidth(309),
        child: TextFormField(
          style: context.textTheme.subtitle1!.copyWith(color: context.theme.colorScheme.onSecondary,decoration: TextDecoration.none),
          inputFormatters: [
            //users can only enter letters.
            FilteringTextInputFormatter.allow(
                RegexConstants.instance.nameRegExp)
          ],
          controller: controller,
          decoration: _inputDecoration(context),
        ));
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: isFilterActive
                ? _removeFiltersButton(context)
                : null,
            prefixIcon: SvgEnums.search_icon.svgIcon(),
            label: Text(
              LocaleKeys.general_search.tr(),
              style: context.textTheme.subtitle1!
                  .copyWith(color: context.theme.colorScheme.tertiary),
            ));
  }

  IconButton _removeFiltersButton(BuildContext context) {
    return IconButton(
                    icon: Icon(IconConstants.instance.removeFilter, color: context.theme.colorScheme.secondary,size: context.dynamicHeight(15)),
                    onPressed: onRemove,
                  );
  }
}
