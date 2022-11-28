import 'package:flutter/material.dart';

import 'component_text.dart';

class ComponentLinkLists extends StatelessWidget {
  final text;
  final isLast;

  const ComponentLinkLists({
    Key? key,
    this.text,
    this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.add),
          title: ComponentText(
            text: text,
            color: Colors.black,
          ),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
        ),
        isLast != true
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(
                  thickness: 2,
                ),
              )
            : Container(),
      ],
    );
  }
}
