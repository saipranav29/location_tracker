
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:klimbb/app_config.dart';
import 'package:klimbb/constants/api_constants.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/hive_models/boxes.dart';
import 'package:klimbb/hive_models/location_profile.dart';
import 'package:klimbb/l10n/l10n.dart';
import 'package:klimbb/utils/router.dart';

@pragma('vm:entry-point')
mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(LocationProfileAdapter(),override: false);
  locationProfileBox = await Hive.openBox<LocationProfile>(ApiConstants.locationProfileBox);

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
      theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          fontFamily: 'Rubik',
          textTheme: const TextTheme()),
      initialRoute: '/home',
      localizationsDelegates:  const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}
