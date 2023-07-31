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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final CustomSizeController customSizeController =
        Get.find<CustomSizeController>();
    final HomeScreenController homeScreenController =
        Get.find<HomeScreenController>();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.grey[400],
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
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(4),
                        bottom: customSizeController.getHeight(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Latitude",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                        const Text(
                          "Longitude",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: customSizeController.getWidth(12),
                        ),
                        Text(
                          "${widget.lpObject.lng} ${widget.lpObject.lngSign}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
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
              child: const Text(
                "Select Font Size",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
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
                    child: const Text(
                      "Headline",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child: const Text(
                      "Label",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(8),
                        left: customSizeController.getWidth(24)),
                    width: screenWidth * 0.25,
                    child: const Text(
                      "Body",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,

                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        value: null,
                        onChanged: (newValue) {
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
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,
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
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        itemHeight: customSizeController.getHeight(40),
                        iconSize: 24,
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
              child: const Text(
                "Pick a Color",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
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
                    color: Colors.black,
                    textColor: Colors.white,
                    labelText: "Submit",
                    borderColor: Colors.black,
                    onPressed: () {
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
