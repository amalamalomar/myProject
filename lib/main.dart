//////amal
/////lllllllllllllllllll
import 'dart:convert';

import 'package:charityapp/getx_bending/log_in_binding.dart';
import 'package:charityapp/hhhhhhhhhhhhhhh.dart';
import 'package:charityapp/screens/Activity_Screen/add_activity/Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/Cur_pas_Activities.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/Current_Activities.dart';
import 'package:charityapp/screens/Activity_Screen/past_activities/Past_Activities.dart';
import 'package:charityapp/screens/Activity_Screen/update_activites/update_activity.dart';
import 'package:charityapp/screens/Order_Screen/Accepted_orders.dart';
import 'package:charityapp/screens/Order_Screen/order_menu/Order_Menu.dart';
import 'package:charityapp/screens/Order_Screen/UnAcceptable_Order.dart';
import 'package:charityapp/screens/Order_Screen/add_order/Add_Order.dart';
import 'package:charityapp/screens/home_page/homeScreen.dart';
import 'package:charityapp/screens/log_in/login.dart';
import 'package:charityapp/screens/register/register.dart';
import 'package:charityapp/screens/splash_screen/splashScreen.dart';
import 'package:charityapp/screens/waghaalmostakdem1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'getx_bending/log_in_binding.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home', //register',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/currentActivites', page: () => CurrentActivities()),
        GetPage(name: '/updateActivites', page: () => EditActivity()),
        GetPage(name: '/addActivites', page: () => AddCurrentActivity()),
        GetPage(name: '/UserInterface', page: () => UserInterface()),
        GetPage(name: '/AddOrder', page: () => AddOrder()),
        GetPage(name: '/PastActivities', page: () => PastActivities()),
        GetPage(name: '/OrderMenu', page: () => OrderMenu()),
        GetPage(name: '/Cur_Pas_Activities', page: () => Cur_Pas_Activities()),
        GetPage(name: '/OrderMenu2', page: () => OrderMenu2()),
        GetPage(
            name: '/SplashScreeencharity', page: () => SplashScreeencharity()),
      ],
      debugShowCheckedModeBanner: false,
      //   builder: EasyLoading.init(),
      title: 'Charity management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //UnAcceptableOrder(),//RegisterScreen(),//ListData(),//CurrentActivities(),//OrderMenu(),//UserInterface(),//LoginScreen(),//OrderMenu(),//CurrentActivities(),//PastActivities(),//OrderMenu(), //PastActivities(),//UserInterface(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreeencharity(),
//       //UnAcceptableOrder(),//RegisterScreen(),//ListData(),//CurrentActivities(),//OrderMenu(),//UserInterface(),//LoginScreen(),//OrderMenu(),//CurrentActivities(),//PastActivities(),//OrderMenu(), //PastActivities(),//UserInterface(),
//     );
//   }
// }
