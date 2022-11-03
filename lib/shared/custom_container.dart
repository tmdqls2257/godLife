import 'package:flutter/material.dart';

import 'shared.dart';

class CustomContainer extends Container {
  final Widget widget;
  final CustomW width;
  CustomContainer({
    super.key,
    required this.widget,
    this.width = CustomW.w1,
  }) : super(
          width: customW[width],
          height: 60,
          padding: const EdgeInsets.fromLTRB(19, 20, 19, 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: customColor[ColorType.orange]!,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: widget,
        );
}
