// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart';

class TextStyleConstants {
  static TextStyle thinStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w100,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle lightStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w300,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle regularStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w400,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle mediumStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w500,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle semiBoldStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w600,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle boldStyle({
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorConstants.black,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w700,
      height: height,
      decoration: decoration ?? TextDecoration.none,
    );
  }
}
