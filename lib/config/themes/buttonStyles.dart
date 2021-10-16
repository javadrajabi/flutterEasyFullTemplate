import 'package:flutter/material.dart';

class MyButton {

  static ButtonStyle display1(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
          return Theme.of(context).colorScheme.secondary.withOpacity(0.5); // Use the component's default.
        },
      ),
    );
  }
}