extension Formatter on String {
  String formatTimeZoneName() {
    String slashesRemoved = replaceAll("/", ", ");
    String underScoreRemoved = slashesRemoved.replaceAll("_", " ");
    return underScoreRemoved;
  }


  //API returns the timezones like America/Argentina this func helps us to get just contient name
  String continentName() {
    return split("/")[0];
  }


  String get addingDigit => length == 1 ? "0" + this : this;

  //API returns the timezones like America/Argentina this func helps us to get just coutry name but sometimes timezones are like America/Argentina/Heaven for both cases ths func returns everything except continetn name by changing back slashes with comma 
  String? countryName() {
    if (split("/").length > 1) {
      var newString = split("/");
      String continentRemoved = newString.length > 2
          ? newString[1] + ", " + newString[2]
          : newString[1];
      
      return continentRemoved.replaceAll("_", " "); 
    } else {
      return null;
    }
  }
}
