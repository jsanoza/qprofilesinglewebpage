import 'package:flutter/material.dart';

import 'component_listtext.dart';

class ComponentSocialButton extends StatelessWidget {
  const ComponentSocialButton({
    Key? key,
    this.socialName,
    required this.onTap,
  }) : super(key: key);

  final socialName;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // log(controller.landingController.socialmedia.first.facebook);
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8,
          bottom: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: ComponentListText(
              fromSocial: true,
              assetIcon: "assets/defaults/Socials/kc${socialName}.png",
              // text: controller.landingController.socialmedia.first.facebook,
              text: socialName,
              isDense: true,
            ),
          ),
        ),
      ),
    );
  }
}
