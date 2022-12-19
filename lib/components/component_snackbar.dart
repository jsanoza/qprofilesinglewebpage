import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component_text.dart';

SnackbarController ComponentSnackbar(
  title,
  BuildContext context,
  subtitle,
  isIcon,
  icon,
  seconds,
) {
  return Get.snackbar(
    title,
    "",
    snackPosition: SnackPosition.TOP,
    colorText: Colors.black,
    borderRadius: 10,
    backgroundColor: Colors.white,
    duration: Duration(seconds: seconds),
    margin: EdgeInsets.all(8),
    maxWidth: context.width,
    icon: isIcon ? icon : Container(),
    // Icon(
    //   Icons.check_circle_outline_rounded,
    //   color: Colors.green,
    //   size: 28,
    // ) : Container()
    messageText: ComponentText(
      text: subtitle,
      fontSize: 14,
      color: Colors.black,
      overflow: TextOverflow.visible,
    ),
  );
}
