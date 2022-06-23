extension Formatter on String {
  String formatTimeZoneName() {
    String slashesRemoved = replaceAll("/", ", ");
    String underScoreRemoved = slashesRemoved.replaceAll("_", " ");
    return underScoreRemoved;
  }

  String continentName() {
    return split("/")[0];
  }

  String get addingDigit => length == 1 ? "0" + this : this;

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
