class Demo {
  String? number;
  String? rating;
  String? type;
  String? country;
  String? listingType;

  Demo({this.number, this.rating, this.type, this.country, this.listingType});

  Demo.fromJson(Map<String, dynamic> json) {
    number = "";
    rating = "";
    type = "";
    country = "";
    listingType = "";
  }
}
