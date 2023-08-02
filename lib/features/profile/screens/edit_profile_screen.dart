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
import 'package:klimbb/hive_models/location_profile.dart';
import 'package:klimbb/main_common.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  final LocationProfile lpObject;
  final int documentIndex;
  final String appBarTitle;

  const EditProfileScreen({Key? key, required this.lpObject, required this.appBarTitle, required this.documentIndex}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
  String selectedHeadlineFontSize = "8";
  String selectedLabelFontSize = "9";
  String selectedBodyFontSize ="10";
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
  void initState() {
    selectedHeadlineFontSize = widget.lpObject.headlineFontSize.toString();
    selectedLabelFontSize = widget.lpObject.labelFontSize.toString();
    selectedBodyFontSize = widget.lpObject.bodyFontSize.toString();
    String mainColor =
    widget.lpObject.color.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(mainColor, radix: 16);
    currentColor = Color(value);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final dynamicTheme = Provider.of<DynamicTheme>(context);
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
            "Edit Profile",
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                        Text(
                          "Longitude",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
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
                          "${widget.lpObject.lat} ${widget.lpObject.latSign}",
                          style:  TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                        Text(
                          "${widget.lpObject.lng} ${widget.lpObject.lngSign}",
                          style:  TextStyle(
                              fontWeight: FontWeight.normal,
                              color:Theme.of(context).primaryColor,
                              fontSize: 16),
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
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: invertColor(Theme.of(context).primaryColor,),
                    fontSize: 18),
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: invertColor(Theme.of(context).primaryColor,),
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child:  Text(
                      "Label",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:invertColor(Theme.of(context).primaryColor,),
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child:  Text(
                      "Body",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:invertColor(Theme.of(context).primaryColor,),
                          fontSize: 16),
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
                        value == null ? "Select a sign" : selectedHeadlineFontSize,
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        value: null,
                        onChanged: ( newValue) {
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
                        value == null ? "Select a sign" : selectedLabelFontSize,
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        value: null,
                        onChanged: ( newValue) {
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
                        value == null ? "Select a sign" : selectedBodyFontSize,
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        value: null,
                        onChanged: ( newValue) {
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
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: invertColor(Theme.of(context).primaryColor),
                    fontSize: 18),
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
                    labelText: "Submit",
                    borderColor: Colors.black,
                    onPressed: () {
                      dynamicTheme.updatePrimaryColor(
                          selectedColor,
                          widget.lpObject.headlineFontSize,
                          widget.lpObject.labelFontSize,
                          widget.lpObject.bodyFontSize);
                      homeScreenController.editProfile(
                          widget.lpObject.lat,
                         widget.lpObject.lng,
                          selectedColor.toString(),
                          double.parse(selectedHeadlineFontSize),
                          widget.lpObject.latSign,
                          widget.lpObject.lngSign,
                          double.parse(selectedLabelFontSize),
                          double.parse(selectedBodyFontSize),widget.documentIndex);
                      Get.offAll(() =>  const HomeScreen());
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
