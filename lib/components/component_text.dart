import 'package:flutter/material.dart';

class ComponentText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final bool? shadow;
  const ComponentText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.decoration,
    this.fontStyle,
    this.overflow,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        fontStyle: fontStyle != null ? FontStyle.italic : fontStyle,
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.white,
        wordSpacing: wordSpacing,
        overflow: overflow ?? TextOverflow.ellipsis,
        shadows: shadow == true
            ? <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 3.0,
                  color: Colors.grey,
                ),
                Shadow(
                  offset: Offset(0.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.grey,
                ),
              ]
            : <Shadow>[],
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
