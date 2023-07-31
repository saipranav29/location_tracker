//
// Copyright (c) 2023 Assertion Inc. All Rights Reserved
//
// THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF ASSERTION INC
//
// Unauthorized copying and redistribution of this file, via any medium
// is strictly prohibited without written permission of Assertion Inc.
//
/*
Description:
    Router file to create different routes used in the app.
Authors:
    Sai Pranav Dhupati
    Sumith S B
Created:
    26 June, 2023
*/

import 'package:get/get.dart';
import 'package:klimbb/features/home/screens/home_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
