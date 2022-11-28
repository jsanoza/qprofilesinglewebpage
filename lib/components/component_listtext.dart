import 'package:flutter/material.dart';

import 'component_text.dart';

class ComponentListText extends StatelessWidget {
  final isDense;
  final text;
  final IconData? icon;
  final String? assetIcon;
  final fromSocial;
  const ComponentListText({
    Key? key,
    this.isDense,
    this.text,
    this.icon,
    this.assetIcon,
    this.fromSocial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: assetIcon != null
          ? Image.asset(
              assetIcon!,
              width: fromSocial != null ? 80 : 20,
              height: fromSocial != null ? 80 : 20,
              scale: fromSocial != null ? 1 : 1.5,
            )
          : null,
      dense: true,
      visualDensity: isDense == true ? VisualDensity(horizontal: -4, vertical: -4) : VisualDensity(horizontal: -0, vertical: -0),
      title: ComponentText(
        text: text,
        textAlign: TextAlign.justify,
        color: Colors.black,
        fontSize: 14,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
