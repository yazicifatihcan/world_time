class DistrictTimeData {
  DateTime? datetime;
  String? timezone;
  String? abbreviation;

  DistrictTimeData({this.timezone, this.datetime, this.abbreviation});

  DistrictTimeData.fromJson(Map<String, dynamic> json) {
    String dateTime = json['datetime'];

    DateTime? localTime =
        DateTime.tryParse(dateTime.substring(0, dateTime.length - 6));

    abbreviation = "GMT " + dateTime.substring(dateTime.length - 6);
    datetime = localTime;
    timezone = json['timezone'];
  }
}
