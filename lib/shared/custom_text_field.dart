import 'package:flutter/material.dart';

import 'shared.dart';

class CustomTextField extends TextField {
  final String hint;
  CustomTextField({
    super.key,
    required super.controller,
    required this.hint,
  }) : super(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: customColor[ColorType.orange]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: customColor[ColorType.orange]!,
                width: 1.0,
              ),
            ),
          ),
        );
}
