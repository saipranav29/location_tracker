
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:klimbb/app_config.dart';
import 'package:klimbb/constants/api_constants.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/hive_models/boxes.dart';
import 'package:klimbb/hive_models/location_profile.dart';
import 'package:klimbb/utils/router.dart';
import 'package:provider/provider.dart';



class DynamicTheme with ChangeNotifier {
  dynamic _primaryColor = Colors.white;
  double headLineFontSize = 14.0;
  double labelFontSize = 12.0;
  double bodyFontSize = 10.0;

  ThemeData get currentTheme => ThemeData(primaryColor: _primaryColor,textTheme:  TextTheme(
    headlineLarge: TextStyle(
      fontSize: headLineFontSize,
      fontWeight: FontWeight.normal
    ),
    labelLarge: TextStyle(
        fontSize: labelFontSize,
        fontWeight: FontWeight.normal
    ),
    bodyLarge: TextStyle(
        fontSize: bodyFontSize,
        fontWeight: FontWeight.normal
    ),
  ));

  void updatePrimaryColor(Color newColor,double headline,double label,double body) {
    _primaryColor = newColor;
    headLineFontSize = headline;
    labelFontSize = label;
    bodyFontSize = body;
    notifyListeners();
  }
}

mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(LocationProfileAdapter(), override: false);
  locationProfileBox =
      await Hive.openBox<LocationProfile>(ApiConstants.locationProfileBox);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
        CustomSizeController(
            screenHeight: MediaQuery.of(context).size.height,
            screenWidth: MediaQuery.of(context).size.width),
        permanent: true);
    var config = AppConfig.of(context);
    return GetMaterialApp(
      title: config?.appName ?? "Location Tracker",
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: Provider.of<DynamicTheme>(context).currentTheme,
      initialRoute: '/home',

    );
  }
}



