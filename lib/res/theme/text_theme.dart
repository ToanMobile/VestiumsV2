import 'package:flutter/material.dart';

import '/res/style.dart';
import 'theme_service.dart';

const fontFamily = "GoogleSans";

const fontApp = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
);

TextStyle get text10 => fontApp.copyWith(fontSize: 10.ts);

TextStyle get text11 => fontApp.copyWith(fontSize: 11.ts);

TextStyle get text12 => fontApp.copyWith(fontSize: 12.ts);

TextStyle get text13 => fontApp.copyWith(fontSize: 13.ts);

TextStyle get text14 => fontApp.copyWith(fontSize: 14.ts);

TextStyle get text16 => fontApp.copyWith(fontSize: 16.ts);

TextStyle get text18 => fontApp.copyWith(fontSize: 18.ts);

TextStyle get text20 => fontApp.copyWith(fontSize: 20.ts);

TextStyle get text22 => fontApp.copyWith(fontSize: 22.ts);

TextStyle get text24 => fontApp.copyWith(fontSize: 24.ts);

TextStyle get text26 => fontApp.copyWith(fontSize: 26.ts);

TextStyle get text28 => fontApp.copyWith(fontSize: 28.ts);

TextStyle get text34 => fontApp.copyWith(fontSize: 34.ts);

extension TextStyleExt on TextStyle {
  //Weight style
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get normalItalic => copyWith(fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);

  TextStyle get normalLineThrough => copyWith(fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough);

  //height style
  TextStyle get height14Per => copyWith(height: 1.4);

  TextStyle get height15Per => copyWith(height: 1.5);

  TextStyle get height16Per => copyWith(height: 1.6);

  TextStyle get height17Per => copyWith(height: 1.7);

  TextStyle get height18Per => copyWith(height: 1.8);

  TextStyle get height19Per => copyWith(height: 1.9);

  TextStyle get height20Per => copyWith(height: 2.0);

  TextStyle get height21Per => copyWith(height: 2.1);

  TextStyle get height22Per => copyWith(height: 2.2);

  //Color style
  TextStyle get textWhiteColor => copyWith(color: getColor().textColorWhite);

  TextStyle get textBlackColor => copyWith(color: getColor().bgThemeColor00DDD4);

  TextStyle get textColor141414 => copyWith(color: getColor().textColor141414);

  TextStyle get textColorB90D18 => copyWith(color: getColor().textColorB90D18);

  TextStyle get textColor777777 => copyWith(color: getColor().textColor777777);

  TextStyle get textColorB2B2B2 => copyWith(color: getColor().textColorB2B2B2);

  TextStyle get textColor0083ED => copyWith(color: getColor().textColor0083ED);

  TextStyle get textColorPrimary => copyWith(color: getColor().textColorPrimary);

  TextStyle get textColorF20606 => copyWith(color: getColor().textColorF20606);

  TextStyle get textColorFF6F15 => copyWith(color: getColor().textColorFF6F15);

  TextStyle get textColor00AC44 => copyWith(color: getColor().textColor00AC44);

  TextStyle get textColorWhite => copyWith(color: getColor().textColorWhite);

  TextStyle get textColor929394 => copyWith(color: getColor().textColor929394);

  TextStyle get textColorD67402 => copyWith(color: getColor().textColorD67402);

  TextStyle get textColor0E66AC => copyWith(color: getColor().textColor0E66AC);

  TextStyle get textColorD3D3D4 => copyWith(color: getColor().textColorD3D3D4);

  TextStyle get textErrorColor => copyWith(color: getColor().error);
}

TextTheme createTextTheme() => TextTheme(
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 14.ts,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 14.ts,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 12.ts,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 16.ts,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.ts,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 20.ts,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 24.ts,
      ),
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 28.ts,
      ),
    );
