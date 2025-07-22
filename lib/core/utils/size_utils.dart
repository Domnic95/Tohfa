import 'package:flutter/cupertino.dart';

Size size =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

num statusBar = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first)
    .viewPadding
    .top;
num bottomBar = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first)
    .viewPadding
    .bottom;

get height {
  num statusBar = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first)
      .viewPadding
      .top;
  num bottomBar = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first)
      .viewPadding
      .bottom;
  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

get width {
  return size.width;
}

double getHorizontalSize(double px) {
  if (width == 0 || px.isInfinite || px.isNaN) {
    return 0.0; // or some default value
  }
  return ((px * width) / width);
}

double getVerticalSize(double px) {
  if (height == 0 || px.isInfinite || px.isNaN) {
    return 0.0; // or some default value
  }
  return ((px * height) / (height - statusBar));
}

double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);

  if (height.isInfinite || height.isNaN || width.isInfinite || width.isNaN) {
    return 0.0; // or some default value
  }

  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

double getFontSize(double px) {
  return getSize(px);
}

double statusBarSize() {
  return MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first)
      .viewPadding
      .top;
}

double systemNavigationBarSize() {
  return MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first)
      .viewPadding
      .bottom;
}

EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

EdgeInsetsGeometry getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}