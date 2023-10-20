import 'dart:ui';

import 'package:flutter/material.dart';

class StandardText extends StatelessWidget {
  const StandardText({required this.text, super.key, this.style});

  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text ?? '',
        style: style,
      ),
    );
  }
}
