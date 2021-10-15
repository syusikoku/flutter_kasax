import 'package:flutter/material.dart';

/// 有问题未验证过
class SlideLeft2Right extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  /// 动画效果从左边到右边的参数(primary)
  final Tween _primarySlideLeftToRight = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero);

  /// 动画效果从左边到右边的参(secondary)
  final Tween _secondarySlideLeftToRight = Tween(begin: Offset.zero, end: const Offset(1.0, 0.0));

  SlideLeft2Right(this.widget, {this.duration = 300})
      : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (context, anim1, anim2) {
              return widget;
            },
            transitionsBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(CurvedAnimation(parent: anim1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
