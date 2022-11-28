// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart' as pp;
// import 'package:vcard_maintained/vcard_maintained.dart';

// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});

//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }

// class _ContactPageState extends State<ContactPage> {
//   var vCard = VCard();
//   @override
//   void initState() {
//     ///Set properties
//     vCard.firstName = 'FirstName';
//     vCard.middleName = 'MiddleName';
//     vCard.lastName = 'LastName';
//     vCard.organization = 'ActivSpaces Labs';
//     vCard.workPhone = 'Work Phone Number';
//     vCard.birthday = DateTime.now();
//     vCard.url = 'https://github.com/valerycolong';
//     vCard.note = 'Notes on contact';

//     savetoFile();
//     super.initState();
//   }

//   savetoFile() async {
//     ///Create a new vCard

//     /// Save to file
//     vCard.saveToFile('file.vcf');

//     /// Get as formatted string
//     print(vCard.getFormattedString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//           child: ElevatedButton(
//         onPressed: () async {
//           // print(vCard.getFormattedString());

//           // final directory = await pp.getApplicationDocumentsDirectory();
//           // final fs = File('${directory.path}/vCard/exports/contact.vcf');
//           // fs.open();
//         },
//         child: Text("Hello"),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class HelloThere extends StatefulWidget {
  final data;
  final hello;
  const HelloThere({super.key, this.data, this.hello});

  @override
  State<HelloThere> createState() => _HelloThereState();
}

class _HelloThereState extends State<HelloThere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            QrImage(
              data: widget.data,
              version: QrVersions.auto,
              size: 200.0,
            ),
            ElevatedButton(
              onPressed: () {
                Share.shareXFiles(widget.hello);
              },
              child: Text("Hello"),
            )
          ],
        ),
      ),
    );
  }
}
