import 'package:flutter/material.dart';

import 'theme.dart';

enum TypoType {
  h1,
  h2,
  h3,
  h3Light,
  bodyBolder,
  body,
  bodyLight,
  labelBolder,
  labelLight,
  labelSmaller,
  labelTiny
}

class TypoStyle {
  final FontWeight fontWeight;
  final double fontSize;

  String? fontFamily;
  TypoStyle({
    required this.fontWeight,
    required this.fontSize,
    this.fontFamily,
  });
}

final typoStyle = {
  TypoType.h1: TypoStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    fontFamily: 'Gmarket Sans',
  ),
  TypoType.h2: TypoStyle(fontWeight: FontWeight.w700, fontSize: 18),
  TypoType.h3: TypoStyle(fontWeight: FontWeight.w700, fontSize: 16),
  TypoType.h3Light: TypoStyle(fontWeight: FontWeight.w400, fontSize: 16),
  TypoType.bodyBolder: TypoStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  TypoType.body: TypoStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  TypoType.bodyLight: TypoStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  TypoType.labelBolder: TypoStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
  ),
  TypoType.labelLight: TypoStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
  TypoType.labelSmaller: TypoStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10,
  ),
  TypoType.labelTiny: TypoStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  ),
};

class CustomText extends Text {
  final String text;
  final TypoType typoType;
  final ColorType? color;
  final double? height;

  CustomText({
    super.key,
    this.text = '',
    super.textAlign = TextAlign.center,
    this.typoType = TypoType.body,
    this.color = ColorType.black,
    this.height,
  }) : super(
          text,
          style: TextStyle(
            color: customColor[color],
            fontWeight: typoStyle[typoType]!.fontWeight,
            fontSize: typoStyle[typoType]!.fontSize,
            fontFamily: typoStyle[typoType]?.fontFamily,
            height: height,
          ),
        );
}
