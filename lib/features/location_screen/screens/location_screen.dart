import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/constants/typography.dart';
import 'package:klimbb/features/components/custom_button.dart';
import 'package:klimbb/features/components/custom_text_field.dart';
import 'package:klimbb/features/home/controller/home_screen_controller.dart';
import 'package:klimbb/features/profile/screens/profile_creation_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<DropdownMenuItem<String>> signs = [
    const DropdownMenuItem(
      value: "+",
      child: Text(
        "+",
        style: TextStyle(fontSize: 16),
      ),
    ),
    const DropdownMenuItem(
        value: "-",
        child: Text(
          "-",
          style: TextStyle(fontSize: 16),
        )),
  ];
  String selectedLatSign = "+";
  String selectedLngSign = "-";
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  dynamic latitudeErrorText = "";
  dynamic longitudeErrorText = "";

  void validateLatitude(String lat) {
    double latitude;
    latitude = double.parse(lat);

    setState(() {
      if (lat.isEmpty) {
        latitudeErrorText = "Please enter latitude value";
      } else if (!(latitude >= 0 && latitude <= 90)) {
        latitudeErrorText = 'Latitude must be between 0 and 90 degrees';
      } else if (lat.split(".")[1].length < 8) {
        latitudeErrorText =
            "Please enter at least eight digits after decimal place";
      } else {
        latitudeErrorText = null;
      }
    });
  }

  void validateLongitude(String lng) {
    double longitude;
    longitude = double.parse(lng);

    setState(() {
      if (lng.isEmpty) {
        longitudeErrorText = "Please enter longitude value";
      } else if (!(longitude >= 0 && longitude <= 180)) {
        longitudeErrorText = 'Longitude must be between 0 and 180 degrees';
      } else if (lng.split(".")[1].length < 8) {
        longitudeErrorText = "Please enter eight digits after decimal place";
      } else {
        longitudeErrorText = null;
      }
    });
  }

  Color invertColor(Color color) {
    int invertedRed = 255 - color.red;
    int invertedGreen = 255 - color.green;
    int invertedBlue = 255 - color.blue;
    return Color.fromARGB(
        color.alpha, invertedRed, invertedGreen, invertedBlue);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final CustomSizeController customSizeController =
        Get.find<CustomSizeController>();
    final HomeScreenController homeScreenController =
        Get.find<HomeScreenController>();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title:  Text(
          "Add Location Ordinates",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Theme.of(context).primaryColor)
        ),
        centerTitle: true,
        backgroundColor: invertColor(Theme.of(context).primaryColor),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        height: screenHeight,
        width: screenWidth,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: customSizeController.getHeight(24),
                  left: customSizeController.getWidth(24),
                  right: customSizeController.getWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: customSizeController.getHeight(45),
                    width: customSizeController.getWidth(70),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),

                          filled: true,
                          fillColor:invertColor(Theme.of(context).primaryColor),
                          focusColor: invertColor(Theme.of(context).primaryColor),
                          hoverColor: invertColor(Theme.of(context).primaryColor),
                        ),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        itemHeight: null,
                        iconSize: 24,
                        validator: (value) =>
                            value == null ? "Select a sign" : null,
                        dropdownColor: invertColor(Theme.of(context).primaryColor,),
                        focusColor:Theme.of(context).primaryColor,
                        value: selectedLatSign,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLatSign = newValue!;
                          });
                        },
                        items: signs),
                  ),
                  SizedBox(
                    height: customSizeController.getHeight(60),
                    width: customSizeController.getWidth(280),
                    child: textFieldComponent(
                        context: context,
                        fillColor: invertColor(Theme.of(context).primaryColor),
                        hintTextColor: Theme.of(context).primaryColor,
                        onChanged: validateLatitude,
                        controller: latitude,
                        hintText: "Enter Latitude",
                        errorText:
                            latitudeErrorText == "" ? null : latitudeErrorText,
                        keyboardType: TextInputType.number),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: customSizeController.getHeight(12),
                  left: customSizeController.getWidth(24),
                  right: customSizeController.getWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: customSizeController.getHeight(45),
                    width: customSizeController.getWidth(70),
                    child: DropdownButtonFormField(


                        decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(4 * paddingRatio)),
                            borderSide: BorderSide(
                                width: 0.1,
                                color:
                                    Theme.of(context).colorScheme.transparent),
                          ),
                          filled: true,
                          fillColor:invertColor(Theme.of(context).primaryColor),

                          focusColor: invertColor(Theme.of(context).primaryColor),
                          hoverColor: invertColor(Theme.of(context).primaryColor),
                        ),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        itemHeight: null,
                        iconSize: 24,
                        validator: (value) =>
                            value == null ? "Select a sign" : null,
                        dropdownColor: invertColor(Theme.of(context).primaryColor,),
                        focusColor:Theme.of(context).primaryColor,
                        value: selectedLngSign,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLngSign = newValue!;
                          });
                        },
                        items: signs),
                  ),
                  SizedBox(
                    height: customSizeController.getHeight(60),
                    width: customSizeController.getWidth(280),
                    child: textFieldComponent(
                      context: context,
                      onChanged: validateLongitude,
                      fillColor: invertColor(Theme.of(context).primaryColor),
                      hintTextColor: Theme.of(context).primaryColor,
                      controller: longitude,
                      hintText: "Enter Longitude",
                      keyboardType: TextInputType.number,
                      errorText:
                          longitudeErrorText == "" ? null : longitudeErrorText,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: customSizeController.getHeight(4)),
              child: CustomFlatButton(
                height: 50,
                width: 204,
                radius: 33,
                color: invertColor(Theme.of(context).primaryColor,),
                textColor: Theme.of(context).primaryColor,
                labelText: "Submit",
                borderColor: Colors.black,
                onPressed: () {
                  if (latitude.text.isNotEmpty && longitude.text.isNotEmpty)  {

                     homeScreenController.checkProfile(
                         latitude.text.toString()+selectedLatSign.toString()+longitude.text.toString()+selectedLngSign.toString());
                    if (homeScreenController.isRecordExits.value) {
                      Get.defaultDialog(
                        backgroundColor: Theme.of(context).primaryColor,
                        titleStyle: TextStyle(
                          color: invertColor( Theme.of(context).primaryColor,)
                        ),
                        title: 'Profile Already Exists',
                        contentPadding: EdgeInsets.only(
                            left: customSizeController.getWidth(4),
                            right: customSizeController.getWidth(4)),
                        buttonColor: invertColor(Theme.of(context).primaryColor),
                        confirmTextColor: Theme.of(context).primaryColor,
                        middleText:
                            'The entered latitudes and longitudes are already associated with other profile.',
                        middleTextStyle: TextStyle(
                            color: invertColor( Theme.of(context).primaryColor,)
                        ),
                        textConfirm: 'Ok',
                        onConfirm: () {
                          Get.back(); // Close the dialog when the button is pressed
                        },
                      );
                    } else {
                      Get.defaultDialog(
                        backgroundColor: Theme.of(context).primaryColor,
                        titleStyle: TextStyle(
                            color: invertColor( Theme.of(context).primaryColor,)
                        ),
                        title: 'Profile Creation',
                        contentPadding: EdgeInsets.only(
                            left: customSizeController.getWidth(4),
                            right: customSizeController.getWidth(4)),
                        buttonColor: invertColor(Theme.of(context).primaryColor),
                        confirmTextColor: Theme.of(context).primaryColor,
                        middleText: "Create profile for this co-ordinates.",
                        middleTextStyle: TextStyle(
                            color: invertColor( Theme.of(context).primaryColor,)
                        ),
                        textConfirm: 'Create Profile',
                        onConfirm: () {
                          Get.to(() => ProfileCreationScreen(
                              lat: latitude.text.toString(),
                              lng: longitude.text.toString(),
                              latSign: selectedLatSign,
                              lngSign: selectedLngSign));
                        },
                      );
                    }
                  } else {
                    if (latitude.text.isEmpty) {
                      setState(() {
                        latitudeErrorText = "Please enter valid latitude value";
                      });
                    }
                    if (longitude.text.isEmpty) {
                      setState(() {
                        longitudeErrorText =
                            "Please enter valid longitude value";
                      });
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
