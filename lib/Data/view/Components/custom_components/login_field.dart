import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final String labelText;
  const LoginField({
    Key? key,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 60,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: FigmaPalette.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: FigmaPalette.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(35),
          ),
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
