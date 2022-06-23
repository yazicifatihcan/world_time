import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateTimeFormatter on DateTime {
  String dayMonthFullDayName() {
    initializeDateFormatting('tr');
    String formatted = DateFormat.d("tr_TR").format(this) +
        " " +
        DateFormat.MMMM("tr_TR").format(this) +
        ", " +
        DateFormat.EEEE("tr_TR").format(this);
    return formatted;
  }

  String dayMonthFullDayNameDetailPage() {
    initializeDateFormatting('tr');
    String formatted = DateFormat.MMMM("tr_TR").format(this)+
        " " +
        DateFormat.d("tr_TR").format(this) +
        ", " +
        DateFormat.EEEE("tr_TR").format(this);
    return formatted;
  }

  String? get weekDayPlusYear=> (DateFormat.EEEE("tr_TR").format(this)) ;

  String hourMinuteFormatter() {
    String hourFormatted = hour.toString();
    String minuteFormatted = minute.toString();
    hourFormatted = hourFormatted.length ==1 ? "0"+hourFormatted : hourFormatted;
    minuteFormatted = minuteFormatted.length ==1 ? "0"+minuteFormatted : minuteFormatted;
    return hourFormatted.toString() + " : " + minuteFormatted.toString();
  
  }


  String basedOnTime(String name) {
    if (6 < hour && hour <= 10) {
      return "Günaydın, $name";
    }
    if (10 < hour && hour <= 18) {
      return "Tünaydın, $name";
    }
    if (18 < hour && hour <= 22) {
      return "İyi Akşamlar, $name";
    } else {
      return "İyi Geceler, $name";
    }
  }
}
