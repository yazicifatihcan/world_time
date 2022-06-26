

class DistrictTimeData {
  DateTime? datetime;
  String? timezone;
  String? abbreviation;

  DistrictTimeData({this.timezone, this.datetime, this.abbreviation});

  DistrictTimeData.fromJson(Map<String, dynamic> json) {
    String dateTime = json['datetime'];

    //API returns the datetime with gmt value so if we parse it directly to Datetime its makes it equal to GMT which we dont want in here we are removing the GMT part value from API date and parsing it.
    DateTime? localTime =
        DateTime.tryParse(dateTime.substring(0, dateTime.length - 6));

    abbreviation = "GMT" + dateTime.substring(dateTime.length - 6);
    datetime = localTime;
    timezone = json['timezone'];
  }
}
