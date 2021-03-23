import 'package:flutter/material.dart';
import 'widgets.dart';

class ClipContainer extends StatelessWidget {
  final Widget widget;
  final bool vertPadding;
  const ClipContainer({this.widget, this.vertPadding = true});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: isDesktop ? vertPadding ? 10 : 0 : 6),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(isDesktop ? 6.0 : 0),
            child: Material(
              elevation: isDesktop ? 4 : 0,
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              child: widget,
            )));
  }
}
