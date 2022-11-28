import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:azstore/azstore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'package:path_provider/path_provider.dart';

import 'hellothere.dart';

class ProfileController extends GetxController {
  late BuildContext context;
  var isRefresh = false.obs;
  var isDoneFetching = false.obs;
  List<UserModel> userInformation = <UserModel>[].obs;
  List<Links> linkList = <Links>[].obs;
  List<Socials> socialMedia = <Socials>[].obs;
  List<Uint8List> profilePhoto = <Uint8List>[].obs;
  var profilePhotoFromNetwork = "".obs;

  @override
  void onInit() {
    isDoneFetching.value = false;
    log(Get.parameters['newid'].toString());
    fetch();
    super.onInit();
  }

  List<Map<String, dynamic>> mapList = [
    {"name": "Facebook", "asset": "assets/kcFacebook.png"},
    {"name": "Twitter", "asset": "assets/kcTwitter.png"},
    {"name": "GitHub", "asset": "assets/kcGitHub.png"},
    {"name": "Linkedin", "asset": "assets/kcLinkedin.png"}
  ];

  fetch() async {
    isRefresh.value = true;

    Future.delayed(Duration(seconds: 2), (() async {
      final response = await http.post(
        Uri.parse('https://digiqard.azurewebsites.net/api/scanprofile'),
        body: Get.parameters['newid'].toString(),
      );
      fetchPhotos();
      log("IM HERE2");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);
        linkList.clear();
        userInformation = parsedList.map((val) => UserModel.fromJson(val)).toList();

        linkList.addAll(userInformation.first.links);
        log(linkList.first.faviconUrl!);
        socialMedia.addAll(userInformation.first.socials);
        socialMedia.forEach((element) => log(element.name.toString()));
      } else {
        log("${response.statusCode} ${response.reasonPhrase} ");
      }
      log(userInformation.first.organization.toString() + " I AM ORGANIZATION");
      log("IM HERE3");
      isRefresh.value = false;
    }));
  }

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/contact.vcf');
  // }

  // Future<File> _createFile(String data) async {
  //   final file = await _localFile;
  //   return file.writeAsString(data);
  // }

  addToContacts() async {
    log("Im here clicked!");
    showDialog(
        context: context,
        builder: (_) {
          return const AlertDialog(
            title: Text("Coming soon"),
          );
        });

        
    // var vCard = VCard();
    // vCard.firstName = 'John';
    // vCard.middleName = 'Pagcu';
    // vCard.lastName = 'Sanoza';
    // vCard.organization = 'QI Group';
    // vCard.workPhone = '093109213890';
    // vCard.birthday = DateTime.now();
    // vCard.url = 'https://github.com/jsanoza';
    // vCard.note = 'Notes on contact';
    // //if platform is not web but mobile browser
    // // if (GetPlatform.isWeb && GetPlatform.isMobile) {

    // // } else {
    // //   Get.dialog(
    // //     Scaffold(
    // //       body: Container(
    // //         color: Colors.white,
    // //         child: Center(
    // //           child: Text("Hello there!,"),
    // //         ),
    // //       ),
    // //     ),
    // //   );
    // // }
    // var contents = vCard.getFormattedString();
    // var vcf = await _createFile(contents);
    // final File file = File(vcf.path);
    // final File filex = File(vcf.path);
    // List<File> addMe = [];
    // addMe.add(filex);
    // String text = await file.readAsString();
    // log(text);
    // log(vcf.path.toString());
    // Get.dialog(HelloThere(
    //   data: contents,
    //   hello: addMe,
    // ));
  }

  fetchPhotos() async {
    log("fetch");
    try {
      profilePhotoFromNetwork.value = "https://digiqard.blob.core.windows.net/userprofilepicture/${Get.parameters['newid'].toString()}.jpg";
      isDoneFetching.value = false;
    } catch (e) {
      print('Exception $e i am exception');
    }
  }
}
