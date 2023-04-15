import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/design_system/ds_theme.dart';
import 'package:flutter_application_1/design_system/ds_window_area_fitted_box.dart';

class DSScaffold extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? bottomNavigationBar;
  final SystemUiOverlayStyle systemUiOverlayStyle;
  final EdgeInsets padding;
  final Color? statusBarBackgroundColor;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  const DSScaffold(
      {required this.child,
      this.backgroundColor,
      this.onTap,
      this.bottomNavigationBar,
      this.systemUiOverlayStyle = SystemUiOverlayStyle.light,
      this.padding = EdgeInsets.zero,
      this.statusBarBackgroundColor,
      this.safeAreaTop = false,
      this.safeAreaLeft = true,
      this.safeAreaRight = true,
      this.safeAreaBottom = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: systemUiOverlayStyle,
        child: Scaffold(
          backgroundColor:
              backgroundColor ?? DSTheme.of(context).color.backgroundColor,
          body: Column(
            children: [
              DSWindowAreaFittedBox(
                fitTop: true,
                color: statusBarBackgroundColor ??
                    DSTheme.of(context).color.systemGreen,
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      onTap?.call();
                    },
                    child: SafeArea(
                        top: safeAreaTop,
                        left: safeAreaLeft,
                        right: safeAreaRight,
                        bottom: safeAreaBottom,
                        child: Container(
                            padding: padding,
                            color: Colors.transparent,
                            child: child))),
              ),
            ],
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      );
}
