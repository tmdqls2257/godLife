import 'package:flutter/material.dart';

import 'shared.dart';

class CustomTextField extends TextField {
  CustomTextField({super.key})
      : super(
          decoration: InputDecoration(
            // labelText: 'Enter Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: customColor[ColorType.orange]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: customColor[ColorType.orange]!, width: 1.0),
            ),
          ),
        );
}
