import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'component_text.dart';

Padding EmptySocialContacts(BuildContext context, width) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 0, top: kIsWeb ? 16 : 0),
    child: Container(
      height: 180,
      width: width,
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/defaults/Empty/kcEmptySadFace.png'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ComponentText(
              text: "Looks like they haven't added any social media yet!",
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
