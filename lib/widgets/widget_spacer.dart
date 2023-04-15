import 'package:flutter/material.dart';
import 'package:vestiums/res/dimens.dart';

class WidgetSpacer extends StatelessWidget {
  double _height = 16;
  double _width;

  WidgetSpacer({double height = 16, double width = 0})
      : this._height = height,
        this._width = width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height.hs,
      width: _width.ws,
    );
  }
}
