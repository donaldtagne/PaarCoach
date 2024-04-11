import 'package:flutter/material.dart';

class WidthWrapper {

  static Widget wrapWithMaxWidth(Widget child, {double maxWidth = 600}) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
