import 'package:flutter/material.dart';

import 'component_text.dart';

class ComponentTitle extends StatelessWidget {
  final text;
  const ComponentTitle({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16),
          child: ComponentText(
            text: text,
            textAlign: TextAlign.justify,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
