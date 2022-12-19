import 'dart:developer';

import 'package:digiqard/components/component_emptysocialcontacts.dart';
import 'package:digiqard/profile/profile_controller.dart';
import 'package:digiqard/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../components/component_emptylistcontacts.dart';
import '../components/component_linklist.dart';
import '../components/component_listtext.dart';
import '../components/component_listtextwithsub.dart';
import '../components/component_profilephoto.dart';
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
      backgroundColor: Color(0xffF0F0F0),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   leading:
      // ),
      bottomNavigationBar: Obx(() => controller.isRefresh.value != true
          ? GestureDetector(
              onTap: () {
                controller.addToContacts();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16, left: 16),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  height: 60,
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
          : Container(
              height: 0,
              width: 0,
            )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveRowColumn(
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.COLUMN,
              children: [
                ResponsiveRowColumnItem(
                  child: Container(
                    height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 375 : 400,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.black,
                              height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 375 : 400,
                              width: context.width,
                              child: Image.asset(
                                "assets/kcDefaultBackdrop.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Obx(() => controller.isRefresh.value != true
                                ? Align(
                                    alignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? Alignment.topCenter : Alignment.center,
                                    child: Padding(
                                      padding: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? const EdgeInsets.only(bottom: 0.0, top: 120) : const EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        // width: 300,
                                        height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 40 : 80,
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
                                                        : controller.userInformation.first.organization == "QIU"
                                                            ? Image.asset(
                                                                "assets/defaults/overlays/kcOverlayQIU.png",
                                                                fit: BoxFit.cover,
                                                              )
                                                            : controller.userInformation.first.organization == "QVI"
                                                                ? Image.asset(
                                                                    "assets/defaults/overlays/kcOverlayQVI.png",
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
                            bottom: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 50 : 60,
                            left: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 20 : 50,
                            child: Obx(() => controller.isRefresh.value != true
                                ? GestureDetector(
                                    onTap: () {
                                      Get.to(ProfilePhoto(
                                        photoUrl: controller.profilePhotoFromNetwork.value,
                                        tag: "profile-image-shared",
                                        isMemory: false,
                                      ));
                                    },
                                    child: Hero(
                                      tag: "profile-image",
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            controller.profilePhotoFromNetwork.value,
                                          )),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(24)),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container())),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16),
                            child: Obx(
                              () => controller.isRefresh.value != true
                                  ? ComponentText(
                                      text: controller.userInformation.first.fullname.toString().toTitleCase(),
                                      color: Colors.black,
                                      textAlign: TextAlign.justify,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible,
                                    )
                                  : Container(),
                            ),
                          ),
                        )
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16),
                          child: ComponentText(
                            text: controller.userInformation.first.position.toString().toTitleCase(),
                            color: Colors.black,
                            textAlign: TextAlign.justify,
                            fontSize: 16,
                            overflow: TextOverflow.visible,
                          ),
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
                  padding: const EdgeInsets.only(left: 24.0, right: 16, top: 24),
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
                              ? controller.userInformation.first.bio.toString() != ""
                                  ? Container(
                                      child: Column(
                                        children: [
                                          ComponentTitle(text: "About Me"),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                                            child: Row(
                                              children: [
                                                ComponentText(
                                                  text: controller.userInformation.first.bio.toString().capitalizeFirst!,
                                                  textAlign: TextAlign.justify,
                                                  color: Color(0xff5C627C),
                                                  fontSize: 16,
                                                  overflow: TextOverflow.visible,
                                                ),
                                              ],
                                            ),
                                          ),
                                          // ComponentListText(
                                          //   text: controller.userInformation.first.bio.toString().capitalizeFirst,
                                          //   isDense: false,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                            child: Divider(
                                              thickness: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 16,
                                    )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ComponentShimmer(
                                    height: 100.0,
                                    width: context.width,
                                  ),
                                ),
                        ),
                        Obx(
                          () => controller.isRefresh.value != true
                              ? GestureDetector(
                                  onTap: () {
                                    launchCall(controller.userInformation.first.phoneCode.toString() + controller.userInformation.first.phoneNumber.toString(), context.width);
                                  },
                                  child: ComponentListText(
                                    assetIcon: "assets/defaults/Icons/kcCall.png",
                                    text: controller.userInformation.first.phoneCode.toString() + " " + controller.userInformation.first.phoneNumber.toString(),
                                    isDense: true,
                                  ),
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
                              ? GestureDetector(
                                  onTap: () {
                                    launchEmail(controller.userInformation.first.email.toString(), context.width, context);
                                  },
                                  child: ComponentListText(
                                    assetIcon: "assets/defaults/Icons/kcEmail.png",
                                    text: controller.userInformation.first.email.toString(),
                                    isDense: true,
                                  ),
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
                                  assetIcon: "assets/defaults/Icons/kcLocation.png",
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
                        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 0, top: kIsWeb ? 16 : 0),
                        child: Obx(
                          () => controller.isRefresh.value != true
                              ? Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    physics: NeverScrollableScrollPhysics(),
                                    childAspectRatio: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 3.5 : 6,
                                    crossAxisCount: 2,
                                    children: controller.socialMedia
                                        .map((item) => ComponentSocialButton(
                                              onTap: () {
                                                launchSocialUrl(item.url.toString());
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
                        ? EmptySocialContacts(context, context.width)
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
                        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 0, top: kIsWeb ? 16 : 8),
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
                                          launchSocialUrl(controller.linkList[index].url!);
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
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  // color: kcPrimaryColor.withOpacity(0.1),
                                                  decoration: controller.linkList[index].faviconUrl != ""
                                                      ? BoxDecoration(
                                                          color: kcPrimaryColor.withOpacity(0.1),
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        )
                                                      : BoxDecoration(),
                                                  child: Center(
                                                    child: FadeInImage(
                                                      placeholder: AssetImage(
                                                        "assets/defaults/Icons/kcScan.png",
                                                      ),
                                                      image: NetworkImage(
                                                        controller.linkList[index].faviconUrl!,
                                                      ),
                                                      imageErrorBuilder: ((context, error, stackTrace) {
                                                        return Center(
                                                          child: Image.asset(
                                                            "assets/defaults/Socials/kcDefaultSocial.png",
                                                            scale: 3,
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ),
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
                                            // child: Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   crossAxisAlignment: CrossAxisAlignment.center,
                                            //   children: [
                                            //     Column(
                                            //       crossAxisAlignment: CrossAxisAlignment.start,
                                            //       mainAxisAlignment: MainAxisAlignment.center,
                                            //       children: [
                                            //         Row(
                                            //           children: [
                                            //             Padding(
                                            //               padding: const EdgeInsets.only(left: 16.0, right: 16),
                                            //               child: ComponentText(
                                            //                 text: controller.linkList[index].name!,
                                            //                 color: Colors.black,
                                            //                 fontWeight: FontWeight.bold,
                                            //                 fontSize: 18,
                                            //                 overflow: TextOverflow.visible,
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //         Row(
                                            //           children: [
                                            //             Padding(
                                            //               padding: const EdgeInsets.only(left: 18.0, right: 16, top: 0),
                                            //               child: ComponentText(
                                            //                 overflow: TextOverflow.visible,
                                            //                 text: controller.linkList[index].url!,
                                            //                 color: Colors.grey,
                                            //                 // fontSize: 20,
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ],
                                            // ),
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
                        ? EmptyLinksContacts(context, context.width)
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
