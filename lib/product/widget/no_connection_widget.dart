import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/lottie_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieEnums.no_wifi.toLottieAsset(height:context.dynamicHeight(70)),);
  }
}