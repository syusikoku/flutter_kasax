import 'package:flutter/material.dart';

/// 有问题未验证过
class SlideBottom2Top extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  final Tween _primarySlideBottomToTop = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
  final Tween _secondarySlideBottomToTop = Tween(begin: Offset.zero, end: const Offset(0.0, -1.0));

  SlideBottom2Top(this.widget, {this.duration = 300})
      : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (context, anim1, anim2) {
              return widget;
            },
            transitionsBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
                    .animate(CurvedAnimation(parent: anim1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
