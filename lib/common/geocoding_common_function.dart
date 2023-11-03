
import 'package:geocoding/geocoding.dart';

class CommonGeoCoding {
  Future<String> convertInAddress({
    required double lat,
    required double lng,
  }) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(lat, lng, localeIdentifier: "en");
    if (placemarks.isNotEmpty) {
      String street =
          placemarks.first.street != null ? placemarks.first.street! + "," : "";
      // String name =
      //     placemarks.first.name != null ? placemarks.first.name! + "," : "";
      String locality = placemarks.first.locality != null
          ? placemarks.first.locality! + ","
          : "";
      String country = placemarks.first.country != null
          ? placemarks.first.country! + ","
          : "";
      String postalCode = placemarks.first.postalCode != null
          ? placemarks.first.postalCode! + ",'"
          : "";
      String subLocality = placemarks.first.subLocality != null
          ? placemarks.first.subLocality! + ","
          : "";
      String address = street + subLocality + locality + postalCode + country;
      return address;
    } else {
      return "";
    }
  }
}
