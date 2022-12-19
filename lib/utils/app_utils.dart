import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../components/component_snackbar.dart';
import '../components/component_text.dart';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

Future<String> networkImageToBase64(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  final bytes = response.bodyBytes;
  return base64Encode(bytes);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}

Future<void> launchCall(String phoneNumber, width) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  Get.bottomSheet(
    Container(
      height: 300,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  top: 20,
                  bottom: 16,
                ),
                child: ComponentText(
                  text: "Open with",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(launchUri);
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/defaults/Icons/kcCall.png",
                        width: 40,
                        height: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ComponentText(
                      text: "Phone",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var can = await canLaunchUrl(Uri.parse("https://wa.me/$phoneNumber/?text=${Uri.encodeFull("Hello")}"));
                  log(can.toString());
                  if (can) {
                    launchUrl(Uri.parse("https://wa.me/$phoneNumber/?text=${Uri.encodeFull("Hello")}"));
                    // Uri.parse("whatsapp://wa.me/$phoneNumber/?text=${Uri.encodeFull("Hello")}");
                  } else {
                    Get.snackbar("Whatsapp", "Whatsapp not installed.", colorText: Colors.white);
                  }
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/defaults/Socials/kcWhatsapp.png",
                        width: 40,
                        height: 40,
                        scale: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ComponentText(
                      text: "Whatsapp",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Center(
                child: ComponentText(
                  text: "Cancel",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Future<void> launchEmail(String email, width, BuildContext context) async {
  Get.bottomSheet(
    Container(
      height: 300,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  top: 20,
                  bottom: 16,
                ),
                child: ComponentText(
                  text: "Open with",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  Get.back();
                  ComponentSnackbar(
                    "Success",
                    context,
                    "This feature will be available on the mobile app.",
                    true,
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                    3,
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/defaults/Icons/kcGmail.png",
                        width: 40,
                        height: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ComponentText(
                      text: "Gmail",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  Get.back();
                  ComponentSnackbar(
                    "Success",
                    context,
                    "This feature will be available on the mobile app.",
                    true,
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                    3,
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/defaults/Icons/kcOutlook.png",
                        width: 40,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ComponentText(
                      text: "Outlook",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: email.toString(),
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'DBC Subject',
                    }),
                  );
                  launchUrl(emailLaunchUri);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // child: Image.asset(
                      //   "assets/defaults/Icons/kcCall.png",
                      //   width: 40,
                      //   height: 30,
                      // ),
                      child: Icon(
                        Icons.mail_outline_rounded,
                        color: Color(0xff8086A1),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const ComponentText(
                      text: "Default email app",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Center(
                child: ComponentText(
                  text: "Cancel",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

launchSocialUrl(String socialUrl) async {
  Uri toLaunch = Uri();
  if (socialUrl.contains("https://")) {
    toLaunch = Uri.parse(socialUrl);
  } else {
    toLaunch = Uri.parse("https://" + socialUrl);
  }
  if (!await launchUrl(
    toLaunch,
    mode: LaunchMode.inAppWebView,
  )) {
    throw 'Could not launch $toLaunch';
  }
}
