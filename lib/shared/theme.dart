import 'package:flutter/material.dart';

enum CustomW { w1, w2, w3, w4 }

final customW = {
  CustomW.w1: 87.0,
  CustomW.w2: 120.0,
  CustomW.w3: 151.0,
  CustomW.w4: double.infinity,
};

enum ColorType { black, orange, white, grey, stroke }

final customColor = {
  ColorType.black: const Color(0xFF2E2929),
  ColorType.orange: const Color(0xFFFFDC97),
  ColorType.white: const Color(0xFFFFFFFF),
  ColorType.grey: const Color(0xFFC9C9C9),
  ColorType.stroke: const Color(0xFFDADADA)
};
