import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/constants/typography.dart';
import 'package:klimbb/features/components/custom_button.dart';
import 'package:klimbb/features/components/loding_component.dart';
import 'package:klimbb/features/home/controller/home_screen_controller.dart';
import 'package:klimbb/features/home/screens/home_screen.dart';

class ProfileCreationScreen extends StatefulWidget {
  final String lat;
  final String lng;
  final String latSign;
  final String lngSign;

  const ProfileCreationScreen(
      {Key? key,
      required this.lat,
      required this.lng,
      required this.latSign,
      required this.lngSign})
      : super(key: key);

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  List<DropdownMenuItem<String>> fontSizes = [
    const DropdownMenuItem(
      value: "8",
      child: Text(
        "8",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "9",
        child: Text(
          "9",
          style: TextStyle(fontSize: 24),
        )),
    const DropdownMenuItem(
      value: "10",
      child: Text(
        "10",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "11",
        child: Text(
          "11",
          style: TextStyle(fontSize: 24),
        )),
    const DropdownMenuItem(
      value: "12",
      child: Text(
        "12",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "14",
        child: Text(
          "14",
          style: TextStyle(fontSize: 24),
        )),
    const DropdownMenuItem(
      value: "16",
      child: Text(
        "16",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "18",
        child: Text(
          "18",
          style: TextStyle(fontSize: 24),
        )),
    const DropdownMenuItem(
      value: "20",
      child: Text(
        "20",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "24",
        child: Text(
          "24",
          style: TextStyle(fontSize: 24),
        )),
    const DropdownMenuItem(
      value: "26",
      child: Text(
        "26",
        style: TextStyle(fontSize: 24),
      ),
    ),
    const DropdownMenuItem(
        value: "28",
        child: Text(
          "28",
          style: TextStyle(fontSize: 24),
        )),

  ];
  String selectedHeadlineFontSize = "14";
  String selectedLabelFontSize = "12";
  String selectedBodyFontSize = "10";
  Color selectedColor = Colors.blue; // Default color value
  Color currentColor = Colors.blue; // Default color value

  void changeColor(Color color) {
    setState(() {
      if (kDebugMode) {
        print(color.toString());
      }
      selectedColor = color;
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
      backgroundColor:Theme.of(context).primaryColor,
      appBar: AppBar(
        title:  Text(
          "Create Profile",
          style:Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Theme.of(context).primaryColor)
        ),
        centerTitle: true,
        backgroundColor: invertColor(Theme.of(context).primaryColor),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Theme.of(context).primaryColor,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: customSizeController.getWidth(24),
                  right: customSizeController.getWidth(24),
                  top: customSizeController.getHeight(24)),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                color: invertColor(Theme.of(context).primaryColor)
                  ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(4),
                        bottom: customSizeController.getHeight(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Text(
                          "Latitude",
                             style: Theme.of(context)
                                 .textTheme
                                 .labelLarge
                                 ?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold)
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                         Text(
                          "Longitude",
                             style: Theme.of(context)
                                 .textTheme
                                 .labelLarge
                                 ?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(4),
                        bottom: customSizeController.getHeight(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${widget.latSign} ${widget.lat}",
                          style:     Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Theme.of(context).primaryColor)
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                        Text(
                          "${widget.lngSign} ${widget.lng} ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Theme.of(context).primaryColor)
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: customSizeController.getHeight(8),
                  left: customSizeController.getWidth(24)),
              child:  Text(
                "Select Font Size",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: invertColor(Theme.of(context).primaryColor),fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child:  Text(
                      "Headline",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: invertColor(Theme.of(context).primaryColor),fontWeight: FontWeight.bold)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child:  Text(
                      "Label",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: invertColor(Theme.of(context).primaryColor),fontWeight: FontWeight.bold)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child:  Text(
                      "Body",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: invertColor(Theme.of(context).primaryColor),fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: customSizeController.getHeight(8),
                      left: customSizeController.getWidth(24),
                    ),
                    width: screenWidth * 0.25,
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
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,
                        validator: (value) =>
                            value == null ? "Select a sign" : null,
                        dropdownColor: invertColor(Theme.of(context).primaryColor,),
                        focusColor:Theme.of(context).primaryColor,
                        value: selectedHeadlineFontSize,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedHeadlineFontSize = newValue!;
                          });
                        },
                        items: fontSizes),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: customSizeController.getHeight(8),
                      left: customSizeController.getWidth(24),
                    ),
                    width: screenWidth * 0.25,
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
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,
                        validator: (value) =>
                            value == null ? "Select a sign" : null,
                        dropdownColor: invertColor(Theme.of(context).primaryColor,),
                        focusColor:Theme.of(context).primaryColor,
                        value: selectedLabelFontSize,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLabelFontSize = newValue!;
                          });
                        },
                        items: fontSizes),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: customSizeController.getHeight(8),
                      left: customSizeController.getWidth(24),
                    ),
                    width: screenWidth * 0.25,
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
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,
                        validator: (value) =>
                            value == null ? "Select a sign" : null,
                        dropdownColor: invertColor(Theme.of(context).primaryColor,),
                        focusColor:Theme.of(context).primaryColor,
                        value: selectedBodyFontSize,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBodyFontSize = newValue!;
                          });
                        },
                        items: fontSizes),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: customSizeController.getHeight(24),
                  left: customSizeController.getWidth(24)),
              child:  Text(
                "Pick a Color",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: invertColor(Theme.of(context).primaryColor),fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: customSizeController.getWidth(24),
                  right: customSizeController.getWidth(24),
                  top: customSizeController.getHeight(8)),
              child: ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: changeColor,
                portraitOnly: true,
              ),
            ),
            Obx(() {
              if (homeScreenController.isHomeScreenLoading.value) {
                return LoadingComponent(
                  color: selectedColor,
                );
              } else {
                return Container(
                  margin:
                      EdgeInsets.only(top: customSizeController.getHeight(4)),
                  child: CustomFlatButton(
                    height: 50,
                    width: 204,
                    radius: 33,
                    color: invertColor(Theme.of(context).primaryColor,),
                    textColor: Theme.of(context).primaryColor,
                    labelText: "Create Profile",
                    borderColor: Colors.black,
                    onPressed: () {
                      homeScreenController.addProfile(
                          widget.lat,
                          widget.lng,
                          selectedColor.toString(),
                          double.parse(selectedHeadlineFontSize),
                          widget.latSign,
                          widget.lngSign,
                          double.parse(selectedLabelFontSize),
                          double.parse(selectedBodyFontSize));
                      Get.offAll(() => const HomeScreen());
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
