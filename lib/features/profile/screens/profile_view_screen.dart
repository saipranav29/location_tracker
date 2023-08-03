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
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).primaryColor)
        ),
        centerTitle: true,
        backgroundColor: invertColor(Theme.of(context).primaryColor,),
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
                  top: customSizeController.getHeight(12)),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          20.0) //                 <--- border radius here
                      ),
                  color: invertColor(
                      Theme.of(context).primaryColor)),
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
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "${widget.lpObject.latSign} ${widget.lpObject.lat.toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                              color:
                              Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
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
                            top: customSizeController.getHeight(4),
                            left: customSizeController.getWidth(8)),
                        child: Text(
                          "${widget.lpObject.lngSign} ${widget.lpObject.lng.toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                              color:
                              Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
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
                      textColor: invertColor(
                        Theme.of(context).primaryColor,
                      ),
                      color: Theme.of(context).primaryColor,
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
