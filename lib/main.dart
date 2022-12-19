import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:http/http.dart' as http;
import 'profile/profile_controller.dart';
import 'profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5)));
      },
      debugShowCheckedModeBanner: false,
      title: 'DigiQard',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // getPages: getRootPage(),
      getPages: [
        GetPage(name: '/home/', page: () => Home()),
        GetPage(name: '/profileView/', page: () => ProfileView(), transition: Transition.zoom),
      ],
      home: const Home(),
      initialBinding: InitialBinding(),
      // initialRoute: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // load();
    checkour();
    super.initState();
  }

checkour(){
  log(Get.parameters['newid'].toString());
  print('i am from home');
}
  // load() {
  //   Future.delayed(Duration(seconds: 2), () async {
  //     Get.offAllNamed(
  //       profileView,
  //       arguments: Get.parameters['refId'].toString(),
  //     );
  //     log("IM HERE");
  //   });
  // }

  // checkour() async {
  //   Future.delayed(Duration(seconds: 2), (() async {
  //     final response = await http.post(
  //       Uri.parse('http://digiqard.azurewebsites.net/api/scanprofile'),
  //       body:Get.parameters['newid'].toString() ,
  //     );

  //     log("IM HERE2");

  //     if (response.statusCode == 200) {
  //       print(response.body);
  //     } else {
  //       log("${response.statusCode} ${response.reasonPhrase} ");
  //     }
  //   }));
  //   log(Get.parameters['newid'].toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(Get.parameters['newid'].toString())),
      ),
    );
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), permanent: true);
  }
}
