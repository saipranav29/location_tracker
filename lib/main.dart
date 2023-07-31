
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klimbb/main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await mainCommon();
    runApp(const MyApp());
  });
}
