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
import 'package:klimbb/main_common.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color invertColor(Color color) {
    int invertedRed = 255 - color.red;
    int invertedGreen = 255 - color.green;
    int invertedBlue = 255 - color.blue;
    return Color.fromARGB(
        color.alpha, invertedRed, invertedGreen, invertedBlue);
  }

  @override
  Widget build(BuildContext context) {
    final dynamicTheme = Provider.of<DynamicTheme>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final CustomSizeController customSizeController =
        Get.find<CustomSizeController>();
    final HomeScreenController homeScreenController =
        Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Home Screen",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).primaryColor)),
        centerTitle: true,
        backgroundColor: invertColor(Theme.of(context).primaryColor),
        actions: [
          (locationProfileBox.isNotEmpty)
              ? CustomFlatButton(
                  height: 50,
                  width: 100,
                  radius: 33,
                  color: Theme.of(context).primaryColor,
                  textColor: invertColor(Theme.of(context).primaryColor,),
                  labelText: "Add",
                  borderColor: Colors.black,
                  onPressed: () {
                    Get.to(() => const LocationScreen());
                  },
                )
              : Container()
        ],
      ),
      body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Theme.of(context).primaryColor,
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
                          child: Text(
                            "Please create Location Profile manually.",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: invertColor(
                                        Theme.of(context).primaryColor)),
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
                            color: invertColor(
                              Theme.of(context).primaryColor,
                            ),
                            textColor: Theme.of(context).primaryColor,
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
                            dynamicTheme.updatePrimaryColor(
                                convertedColor,
                                lp.headlineFontSize,
                                lp.labelFontSize,
                                lp.bodyFontSize);
                            Get.to(() => ProfileViewScreen(
                                  appBarTitle: "PROFILE ${index + 1}",
                                  lpObject: lp,
                                  documentIndex: index,
                                ));
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
                                color: invertColor(
                                    Theme.of(context).primaryColor)),
                            height: customSizeController.getHeight(160),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: customSizeController.getHeight(4)),
                                  child: Text(
                                    "PROFILE ${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                        color:
                                            Theme.of(context).primaryColor),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              customSizeController.getHeight(12),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "Latitude: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                          customSizeController.getHeight(12),
                                          left:
                                              customSizeController.getWidth(8)),
                                      child: Text(
                                        "${lp.lat.toString()} ${lp.latSign}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                      child: Text(
                                        "Longitude: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                      child: Text(
                                        "Headline Font Size: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                      child: Text(
                                        "Label Font Size: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                      child: Text(
                                        "Body Font Size: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                      child: Text(
                                        "Theme Color: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color:
                                            Theme.of(context).primaryColor),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                            color:
                                            convertedColor),
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
