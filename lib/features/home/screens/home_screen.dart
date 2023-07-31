import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/features/components/custom_button.dart';
import 'package:klimbb/features/components/loding_component.dart';
import 'package:klimbb/features/home/controller/home_screen_controller.dart';
import 'package:klimbb/features/location_screen/screens/location_screen.dart';
import 'package:klimbb/features/profile/screens/profile_view_screen.dart';
import 'package:klimbb/hive_models/boxes.dart';
import 'package:klimbb/hive_models/location_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void changeColor(Color color) => setState(() => currentColor = color);
  Color currentColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final CustomSizeController customSizeController =
        Get.find<CustomSizeController>();
    final HomeScreenController homeScreenController =
        Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          CustomFlatButton(
            height: 50,
            width: 100,
            radius: 33,
            color: Colors.black,
            textColor: Colors.white,
            labelText: "Add",
            borderColor: Colors.black,
            onPressed: () {
              Get.to(() => const LocationScreen());
            },
          ),
        ],
      ),
      body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.grey[400],
          child: Obx(() {
            if (homeScreenController.isHomeScreenLoading.value) {
              return const Center(child: LoadingComponent(color: Colors.black));
            } else {
              return (homeScreenController.boxLength.value == 0)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: customSizeController.getHeight(8),
                              bottom: customSizeController.getHeight(8),
                              left: customSizeController.getWidth(24),
                              right: customSizeController.getWidth(24)),
                          child: const Text(
                            "Please create Location Profile manually.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: customSizeController.getHeight(4)),
                          child: CustomFlatButton(
                            height: 50,
                            width: 204,
                            radius: 33,
                            color: Colors.black,
                            textColor: Colors.white,
                            labelText: "Add Location",
                            borderColor: Colors.black,
                            onPressed: () {
                              Get.to(() => const LocationScreen());
                            },
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeScreenController.boxLength.value,
                      itemBuilder: (BuildContext context, int index) {
                        LocationProfile lp = locationProfileBox.getAt(index);
                        String valueString = lp.color
                            .split('(0x')[1]
                            .split(')')[0]; // kind of hacky..
                        int value = int.parse(valueString, radix: 16);
                        Color convertedColor = Color(value);
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ProfileViewScreen(
                                appBarTitle: "PROFILE ${index + 1}",lpObject: lp,documentIndex: index,));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: customSizeController.getWidth(24),
                                right: customSizeController.getWidth(24),
                                top: customSizeController.getHeight(8),
                                bottom: customSizeController.getHeight(8)),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        20.0) //                 <--- border radius here
                                    ),
                                color: Colors.white),
                            height: customSizeController.getHeight(160),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: customSizeController.getHeight(4)),
                                  child: Text(
                                    "PROFILE ${index + 1}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Latitude: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.lat.toString()} ${lp.latSign}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: customSizeController.getHeight(4),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Longitude: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.lng.toString()} ${lp.lngSign}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Headline Font Size: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.headlineFontSize}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                          customSizeController.getHeight(4),
                                          left:
                                          customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Label Font Size: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                          customSizeController.getHeight(4),
                                          left:
                                          customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.labelFontSize}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                          customSizeController.getHeight(4),
                                          left:
                                          customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Body Font Size: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                          customSizeController.getHeight(4),
                                          left:
                                          customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.bodyFontSize}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: const Text(
                                        "Theme Color: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(4),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "${convertedColor.value}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: convertedColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            }
          })),
    );
  }
}
