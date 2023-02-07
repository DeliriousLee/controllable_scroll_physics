<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


## Features

1. 可以控制滑动阻塞，
2. 重写了该组件的弹性系数

## Usage

当设置dampController.banSwipeUp=true,该physics控制的滑动组件将无法往scroll value递增的方向滑动。
例如设置组件的滑动方向为上下，设置banSwipeUp=true那么滑动组件将无法上滑；
当设置组件的滑动方向为左右，设置banSwipeUp=true，那么滑动组件将无法左滑；
```dart
/// 滑动物理控件 控制器
ControllablePhysicsController _controller = ControllablePhysicsController();
```
