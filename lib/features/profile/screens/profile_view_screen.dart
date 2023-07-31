import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/features/components/custom_button.dart';
import 'package:klimbb/features/profile/screens/edit_profile_screen.dart';
import 'package:klimbb/hive_models/location_profile.dart';

class ProfileViewScreen extends StatefulWidget {
  final String appBarTitle;
  final LocationProfile lpObject;
  final int documentIndex;

  const ProfileViewScreen(
      {Key? key, required this.appBarTitle, required this.lpObject, required this.documentIndex})
      : super(key: key);

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
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
    String mainColor =
        widget.lpObject.color.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(mainColor, radix: 16);
    Color convertedColor = Color(value);
    return Scaffold(
      backgroundColor: convertedColor,
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: TextStyle(
            color: convertedColor,
            fontSize: widget.lpObject.headlineFontSize,
          ),
        ),
        centerTitle: true,
        backgroundColor: invertColor(convertedColor),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: convertedColor,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: customSizeController.getWidth(24),
                  right: customSizeController.getWidth(24),
                  top: customSizeController.getHeight(12)),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          20.0) //                 <--- border radius here
                      ),
                  color: invertColor(convertedColor)),
              height: customSizeController.getHeight(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "Latitude: ",
                          style: TextStyle(
                              fontSize: widget.lpObject.bodyFontSize,
                              fontWeight: FontWeight.normal,
                              color: convertedColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "${widget.lpObject.lat.toString()} ${widget.lpObject.latSign}",
                          style: TextStyle(
                              fontSize: widget.lpObject.labelFontSize,
                              fontWeight: FontWeight.bold,
                              color: convertedColor),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: customSizeController.getHeight(4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "Longitude: ",
                          style: TextStyle(
                              fontSize: widget.lpObject.bodyFontSize,
                              fontWeight: FontWeight.normal,
                              color: convertedColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "${widget.lpObject.lng.toString()} ${widget.lpObject.lngSign}",
                          style: TextStyle(
                              fontSize: widget.lpObject.labelFontSize,
                              fontWeight: FontWeight.bold,
                              color: convertedColor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: customSizeController.getHeight(12)),
                    child: CustomFlatButton(
                      height: 50,
                      width: 204,
                      radius: 33,
                      color: convertedColor,
                      textColor: invertColor(convertedColor),
                      labelText: "Edit Profile",
                      borderColor: Colors.black,
                      onPressed: () {
                        Get.to(() =>  EditProfileScreen(appBarTitle: widget.appBarTitle,lpObject: widget.lpObject,documentIndex: widget.documentIndex,));
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
