import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, this.photoUrl, this.tag, this.isMemory});

  final photoUrl;
  final tag;
  final isMemory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          Get.back();
        },
        onVerticalDragEnd: (details) {
          Get.back();
        },
        onTap: () {
          Get.back();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Hero(
                  tag: tag,
                  child: Center(
                    child: Container(
                      width: 400,
                      height: 400.0,
                      decoration: BoxDecoration(image: isMemory ? DecorationImage(fit: BoxFit.cover, image: MemoryImage(photoUrl)) : DecorationImage(fit: BoxFit.cover, image: NetworkImage(photoUrl))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


 // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 18.0, top: 18),
          //       child: GestureDetector(
          //         onTap: () {
          //           Get.back();
          //         },
          //         child: Container(
          //           child: Icon(
          //             Icons.close,
          //             color: Colors.black,
          //             size: 30,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),