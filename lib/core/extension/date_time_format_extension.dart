import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_time/core/extension/string_extension.dart';
import 'package:world_time/product/init/lang/locale_keys.g.dart';


extension DateTimeFormatter on DateTime {
  
  //I wrote extensions to formatting and managing datetiems
  
  
  //Output formatted to - For Exp. 26 june, Sunday
  String dayMonthFullDayName(BuildContext context) {
    String formatted = DateFormat.d(context.locale.languageCode).format(this) +
        " " +
        DateFormat.MMMM(context.locale.languageCode).format(this) +
        ", " +
        DateFormat.EEEE(context.locale.languageCode).format(this);
    return formatted;
  }

  //Output formatted to - For Exp. june 26, Sunday
  String dayMonthFullDayNameDetailPage(BuildContext context) {
    String formatted = DateFormat.MMMM(context.locale.languageCode).format(this)+
        " " +
        DateFormat.d(context.locale.languageCode).format(this) +
        ", " +
        DateFormat.EEEE(context.locale.languageCode).format(this);
    return formatted;
  }


   //Week day formatter Wednesda instead of Wed
  String? get weekDayPlusYear=> (DateFormat.EEEE().format(this)) ;

  //For example if time is 01:05 API returs 1:5 which is doesnt look like time. With this function if hour or minute is 1 digit we are adding 0 in front of it. And also it combines the hour and minute and puts : behind them.
  String hourMinuteFormatter() {
    String hourFormatted = hour.toString();
    String minuteFormatted = minute.toString();
    hourFormatted = hourFormatted.addingDigit;
    minuteFormatted = minuteFormatted.addingDigit;
    return hourFormatted.toString() + " : " + minuteFormatted.toString();
  
  }


  //returns morning,evening,afternoon or night massage based on time
  String basedOnTime(String name) {
    if (6 < hour && hour <= 10) {
      return "${LocaleKeys.general_morning.tr()}, $name";
    }
    if (10 < hour && hour <= 18) {
      return "${LocaleKeys.general_afternoon.tr()}, $name";
    }
    if (18 < hour && hour <= 22) {
      return "${LocaleKeys.general_evening.tr()}, $name";
    } else {
      return "${LocaleKeys.general_night.tr()}, $name";
    }
  }
}
