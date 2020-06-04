class HelioTour {
  String id;
  double lat;
  double long;
  String name;
  String desc;
  String url;
  String imageUrl;

  HelioTour(String id, double lat, double long, String name, String desc, String url, String imageUrl) {
    this.id = id;
    this.lat = lat;
    this.long = long;
    this.name = name;
    this.desc = desc;
    this.url = url;
    this.imageUrl = imageUrl;
  }
}