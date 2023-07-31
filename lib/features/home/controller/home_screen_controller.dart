import 'package:get/get.dart';
import 'package:klimbb/hive_models/boxes.dart';
import 'package:klimbb/hive_models/location_profile.dart';

class HomeScreenController extends GetxController {
  RxBool isHomeScreenLoading = false.obs;
  RxBool isRecordExits = false.obs;
  RxInt boxLength = 0.obs;

  @override
  void onInit() {
    boxLength.value = locationProfileBox.length;
    super.onInit();
  }

  void checkProfile(String key) async {
    print(key);
    locationProfileBox.values.forEach((element) {
      print(element.id);
    });
    List<dynamic> filteredProfile = [];
    filteredProfile = locationProfileBox.values
        .where((locationProfileFetchedObject) =>
            locationProfileFetchedObject.id.toString().compareTo(key) == 0)
        .toList();
    isRecordExits.value = filteredProfile.isNotEmpty ? true : false;
  }

  void addProfile(String lat, String lng, String color, double headline,
      String latSign, String lngSign, double label, double body) async {
    isHomeScreenLoading.value = true;
    try {
      LocationProfile locationProfileObject = LocationProfile(
          id: lat.toString() + latSign + lng.toString() + lngSign,
          headlineFontSize: headline,
          color: color,
          lat: lat,
          lng: lng,
          latSign: latSign,
          lngSign: lngSign,
          bodyFontSize: body,
          labelFontSize: label);
      await locationProfileBox.add(locationProfileObject);
      boxLength.value = locationProfileBox.length;
    } finally {
      isHomeScreenLoading.value = false;
    }
  }

  void editProfile(
      String lat,
      String lng,
      String color,
      double headline,
      String latSign,
      String lngSign,
      double label,
      double body,
      int documentIndex) async {
    isHomeScreenLoading.value = true;
    try {
      LocationProfile editLocationObject =
          locationProfileBox.getAt(documentIndex);
      editLocationObject.headlineFontSize = headline;
      editLocationObject.labelFontSize = label;
      editLocationObject.bodyFontSize = body;
      editLocationObject.color = color;
      editLocationObject.lat = lat;
      editLocationObject.latSign = latSign;
      editLocationObject.lngSign = lngSign;
      editLocationObject.lng = lng;
      await locationProfileBox.putAt(documentIndex, editLocationObject);

      boxLength.value = locationProfileBox.length;
    } finally {
      isHomeScreenLoading.value = false;
    }
  }
}
