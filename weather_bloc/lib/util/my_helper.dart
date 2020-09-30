class MyHelper {
  static String mapEventToImage(String input) {
    var name = "";
    switch(input) {
      case "sn":
        name = "snow";
      break;
      case "lr":
        name = "lightrain";
      break;
      case "hc":
        name = "heavycloud";
      break;
      case "hr":
        name = "heavyrain";
      break;
      case "c":
        name = "clear";
      break;
      default:
        name = "clear";
    }
    return name;
  }
}