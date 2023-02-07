//
//    @desc : pageView 滑动控制器
//    @file : controllable_physics_controller.dart
//    @date : 23/02/06 10:55
//
class ControllablePhysicsController {
  /// 禁止向下滑动,视频列表向上移动
  late bool banSwipeDown;

  /// 禁止向上滑动,视频列表向下移动
  late bool banSwipeUp;

  double? lastSwipePosition;

  ControllablePhysicsController(
      {this.banSwipeDown = false,
      this.banSwipeUp = false,
      this.lastSwipePosition});
}
