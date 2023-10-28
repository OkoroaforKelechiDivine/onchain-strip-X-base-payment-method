import 'dart:ui';

import 'package:flutter/material.dart';


///MediaQuery Width(responsiveness)
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///MediaQuery Height(responsiveness)
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double testSize(BuildContext context, double size) {
  // print("size being returned: ${size / MediaQuery.of(context).size.height}");
  return size / MediaQuery.of(context).size.height;
}

///design height(responsiveness)
double logicalHeight() {
  var pixelRatio = window.devicePixelRatio;
  var logicalScreenSize = window.physicalSize / pixelRatio;
  var logicalHeight = logicalScreenSize.height;

  return logicalHeight;
}

///design width(responsiveness)
double logicalWidth() {
  var pixelRatio = window.devicePixelRatio;
  var logicalScreenSize = window.physicalSize / pixelRatio;
  var logicalWidth = logicalScreenSize.width;

  return logicalWidth;
}

///design height, draft(responsiveness)
const double draftHeight = 844;

///design width, draft(responsiveness)
const double draftWidth = 390;

///aspect ratio
double aspectRatio(BuildContext context) {
  final double itemHeight = (height(context) - kToolbarHeight - 24) / 2;
  final double itemWidth = width(context) / 2;

  double aspectRatio = (itemWidth / itemHeight);

  return aspectRatio;
}
