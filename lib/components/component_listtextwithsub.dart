import 'package:flutter/material.dart';
import 'component_text.dart';

class ComponentListTextWithSubtitle extends StatelessWidget {
  final isDense;
  final text;
  final subtext;
  const ComponentListTextWithSubtitle({
    Key? key,
    this.isDense,
    this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ComponentText(
        text: text,
        color: Colors.black,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.visible,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left:8.0,top:8),
        child: ComponentText(
          text: subtext,
          color: Colors.black,
          fontSize: 18,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
