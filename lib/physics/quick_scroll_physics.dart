// ignore_for_file: must_be_immutable

import 'package:controllable_scroll_physics/physics/controllable_physics_controller.dart';
import 'package:flutter/material.dart';

class QuickerScrollPhysics extends ClampingScrollPhysics {
  /// 拦截控制器
  ControllablePhysicsController? dampController;
  QuickerScrollPhysics({ScrollPhysics? parent, this.dampController})
      : super(parent: parent);

  @override
  QuickerScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return QuickerScrollPhysics(
        parent: buildParent(ancestor), dampController: dampController);
  }

  /// 返回值，确定要限制滑动的距离
  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (dampController != null) {
      // 处理 禁止左滑或右滑
      final lastSwipePosition = dampController?.lastSwipePosition;
      if (lastSwipePosition != null) {
        // 手势往下滑 value值会越来越小，往上滑 value会越来越大
        // 禁止往下滑,则把value 小于上次的位置设置边界
        if (value < lastSwipePosition && dampController?.banSwipeDown == true) {
          // debugPrint(
          //     'value:$value, maxScrollExtent:${position.maxScrollExtent} , minScrollExtent:${position.minScrollExtent}');
          // debugPrint('value - position.pixels:${value - position.pixels}');
          // 返回要限制的滑动距离 抵消滑动
          return value - position.pixels;
        }
        // 禁止往上滑,则把value 大于上次的位置设置边界
        if (value > lastSwipePosition && dampController?.banSwipeUp == true) {
          // debugPrint(
          //     'value:$value, maxScrollExtent:${position.maxScrollExtent} , minScrollExtent:${position.minScrollExtent}');
          // debugPrint('value - position.pixels:${value - position.pixels}');
          // 返回要限制的滑动距离 抵消滑动
          return value - position.pixels;
        }
      }
      dampController?.lastSwipePosition = value;
    }

    return super.applyBoundaryConditions(position, value);
  }

  @override
  SpringDescription get spring => SpringDescription.withDampingRatio(
        mass: 0.2,
        stiffness: 300.0,
        ratio: 1.1,
      );
}
