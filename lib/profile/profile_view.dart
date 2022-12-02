import 'dart:developer';

import 'package:digiqard/profile/profile_controller.dart';
import 'package:digiqard/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../components/component_linklist.dart';
import '../components/component_listtext.dart';
import '../components/component_listtextwithsub.dart';
import '../components/component_shimmer.dart';
import '../components/component_socialbutton.dart';
import '../components/component_text.dart';
import '../components/component_titletext.dart';
import '../utils/app_colors.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    controller.context = context;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveRowColumn(
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.COLUMN,
              children: [
                ResponsiveRowColumnItem(
                  child: Container(
                    height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 400 : 500,
                    // color: Colors.green,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.black,
                              height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 300 : 400,
                              width: context.width,
                              child: Image.asset(
                                "assets/kDefaultBackdrop.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Obx(() => controller.isRefresh.value != true
                                ? Align(
                                    alignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? Alignment.topCenter : Alignment.center,
                                    child: Padding(
                                      padding: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? const EdgeInsets.only(bottom: 0.0, top: 100) : const EdgeInsets.only(bottom: 150.0),
                                      child: Container(
                                        width: 300,
                                        child: controller.userInformation.first.organization == "QNET"
                                            ? Image.asset(
                                                "assets/defaults/overlays/kcOverlayQnet.png",
                                                fit: BoxFit.cover,
                                              )
                                            : controller.userInformation.first.organization == "QI"
                                                ? Image.asset(
                                                    "assets/defaults/overlays/kcOverlayQIGroup.png",
                                                    fit: BoxFit.cover,
                                                  )
                                                : controller.userInformation.first.organization == "THE V"
                                                    ? Image.asset(
                                                        "assets/defaults/overlays/kcOverlayTheV.png",
                                                        fit: BoxFit.cover,
                                                      )
                                                    : controller.userInformation.first.organization == "RYTHM"
                                                        ? Image.asset(
                                                            "assets/defaults/overlays/kcOverlayRythm.png",
                                                            fit: BoxFit.cover,
                                                          )
                                                        : controller.userInformation.first.organization == "OTHERS"
                                                            ? Image.asset(
                                                                "assets/defaults/overlays/kcOverlayQI.png",
                                                                fit: BoxFit.cover,
                                                              )
                                                            : Image.asset("assets/defaults/overlays/kcOverlayQI.png"),
                                      ),
                                    ),
                                  )
                                : Container()),
                          ],
                        ),
                        Positioned(
                          bottom: -40,
                          left: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 20 : 50,
                          child: Container(
                            height: 300,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0, right: 0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Obx(() => controller.isRefresh.value != true
                                    ? Container(
                                        height: 190,
                                        width: 190,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                            controller.profilePhotoFromNetwork.value,
                                          ),
                                        ),
                                        // child: Image.network("https://digiqard.blob.core.windows.net/userprofilepicture/johnpaul.s@qigroup.com.jpg"),
                                      )
                                    : Container()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 40 : 0,
                          right: 0,
                          child: Container(
                            // color: Colors.green,
                            height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 60 : 100,
                            width: context.width - 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => controller.isRefresh.value != true
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.addToContacts();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 40, top: 16),
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16, right: 16),
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: kcPrimaryColor,
                                              borderRadius: BorderRadius.circular(32.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                ComponentText(
                                                  text: "Add to Contacts",
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ResponsiveRowColumnItem(
              child: Obx(
                () => controller.isRefresh.value != true
                    ? Container(
                        padding: EdgeInsets.all(8),
                        width: context.width,
                        child: ComponentListTextWithSubtitle(
                          isDense: true,
                          text: controller.userInformation.first.fullname.toString().toTitleCase(),
                          subtext: controller.userInformation.first.position.toString(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25),
                        child: ComponentShimmer(
                          height: 100.0,
                          width: context.width,
                        ),
                      ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 16, top: 16),
                  child: Container(
                    // height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => controller.isRefresh.value != true
                              ? Container(
                                  child: Column(
                                    children: [
                                      ComponentTitle(text: "About Me"),
                                      ComponentListText(
                                        text: controller.userInformation.first.bio.toString().capitalizeFirst,
                                        isDense: false,
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ComponentShimmer(
                                    height: 100.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Obx(
                          () => controller.isRefresh.value != true
                              ? ComponentListText(
                                  assetIcon: "assets/kcCall.png",
                                  // icon: Icons.phone,
                                  text: controller.userInformation.first.phoneNumber.toString(),
                                  isDense: true,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                                  child: ComponentShimmer(
                                    height: 15.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                        Obx(
                          () => controller.isRefresh.value != true
                              ? ComponentListText(
                                  assetIcon: "assets/kcEmail.png",
                                  text: controller.userInformation.first.email.toString(),
                                  isDense: true,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                                  child: ComponentShimmer(
                                    height: 15.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                        Obx(
                          () => controller.isRefresh.value != true
                              ? ComponentListText(
                                  assetIcon: "assets/kcLocation.png",
                                  text: controller.userInformation.first.location.toString(),
                                  isDense: true,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                                  child: ComponentShimmer(
                                    height: 15.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 18),
                child: ComponentTitle(text: "Social"),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Obx(
                () => controller.socialMedia.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 0),
                        child: Obx(
                          () => controller.isRefresh.value != true
                              ? Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    physics: NeverScrollableScrollPhysics(),
                                    childAspectRatio: kIsWeb ? 6 / 1.2 : 4 / 1.3,
                                    crossAxisCount: 2,
                                    children: controller.socialMedia
                                        .map((item) => ComponentSocialButton(
                                              onTap: () {
                                                log(item.url.toString());
                                              },
                                              socialName: item.name,
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 16),
                                  child: ComponentShimmer(
                                    height: 150.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                      )
                    : controller.isDoneFetching.value != false
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 0),
                            child: Container(
                              height: 150,
                              width: context.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: ComponentText(
                                  text: "Uh-oh looks like you haven't added any social media profile!",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 0),
                            child: ComponentShimmer(
                              height: 150.0,
                              width: context.width,
                            ),
                          ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: ComponentTitle(text: "Links"),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Obx(
                () => controller.linkList.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 8),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Obx(
                            () => controller.isRefresh.value != true
                                ? ListView.builder(
                                    padding: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.linkList.length,
                                    itemBuilder: ((context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          log(controller.linkList[index].url!);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 0.0, right: 0, top: 0),
                                          child: Container(
                                            height: 70,
                                            width: context.width,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.3)),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                // Container(
                                                //   height: 50,
                                                //   width: 50,
                                                //   // color: kcPrimaryColor.withOpacity(0.1),
                                                //   decoration: BoxDecoration(
                                                //     color: kcPrimaryColor.withOpacity(0.1),
                                                //     borderRadius: BorderRadius.circular(20.0),
                                                //   ),
                                                //   child: Center(
                                                //     child: FadeInImage(
                                                //       placeholder: AssetImage(
                                                //         "assets/defaults/Icons/kcScan.png",
                                                //       ),
                                                //       image: NetworkImage(
                                                //         "https://www.youtube.com/s/desktop/ff71ea81/img/favicon_144x144.png",
                                                //       ),
                                                //       imageErrorBuilder: ((context, error, stackTrace) {
                                                //         return Center(
                                                //           child: Image.asset(
                                                //             "assets/defaults/Icons/kcReorder.png",
                                                //             scale: 3,
                                                //           ),
                                                //         );
                                                //       }),
                                                //     ),
                                                //     // child: Image.network("https://www.youtube.com/s/desktop/ff71ea81/img/favicon_144x144.png"),
                                                //   ),
                                                // ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                                                          child: ComponentText(
                                                            text: controller.linkList[index].name!,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 18,
                                                            overflow: TextOverflow.visible,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 18.0, right: 16, top: 0),
                                                          child: ComponentText(
                                                            overflow: TextOverflow.visible,
                                                            text: controller.linkList[index].url!,
                                                            color: Colors.grey,
                                                            // fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                                    child: ComponentShimmer(
                                      height: 150.0,
                                      width: context.width,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    : controller.isRefresh.value != true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 0),
                            child: Container(
                              height: 150,
                              width: context.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: ComponentText(
                                  text: "Uh-oh looks like you haven't added any links on your profile!",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 0, top: kIsWeb ? 16 : 0),
                            child: ComponentShimmer(
                              height: 150.0,
                              width: context.width,
                            ),
                          ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Container(height: 50),
            ),
          ],
        ),
      ),
    );
  }
}
