import 'package:flutter/material.dart';

import 'shared.dart';

class CustomButton extends ClipRRect {
  final ColorType bgColor;
  final ColorType textColor;
  final String label;
  final CustomW width;
  final double height;
  final TypoType typoType;
  final Function() onPressed;

  CustomButton({
    Key? key,
    this.width = CustomW.w4,
    this.bgColor = ColorType.black,
    this.textColor = ColorType.white,
    this.typoType = TypoType.body,
    this.height = 36.0,
    super.borderRadius = BorderRadius.zero,
    required this.label,
    required this.onPressed,
  }) : super(
          key: key,
          child: Material(
            child: InkWell(
              onTap: onPressed,
              child: Ink(
                height: height,
                width: customW[width],
                decoration: BoxDecoration(
                  color: customColor[bgColor],
                  borderRadius: borderRadius,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: customColor[textColor],
                      fontWeight: typoStyle[typoType]!.fontWeight,
                      fontSize: typoStyle[typoType]!.fontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
}

enum SvgIconType {
  arrowBack,
  bellLight,
  chatIcon,
  chatIconPink,
  lipIcon,
  close,
  editLight,
  feedingBottle,
  flower,
  flowerPink,
  home,
  homePink,
  myProfile,
  myProfilePink,
  logo
}

class CustomOutlinedBtn extends Material {
  final CustomW width;
  final ColorType textColor;
  final String label;
  final double height;
  final Function() onPressed;

  CustomOutlinedBtn({
    Key? key,
    this.width = CustomW.w2,
    this.height = 30.0,
    this.textColor = ColorType.black,
    required this.label,
    required this.onPressed,
  }) : super(
          key: key,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(15.0),
            child: Ink(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              height: height,
              width: customW[width],
              decoration: BoxDecoration(
                color: customColor[ColorType.white],
                border: Border.all(
                  color: customColor[textColor]!,
                ),
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Center(
                child: CustomText(
                  text: label,
                ),
              ),
            ),
          ),
        );
}
