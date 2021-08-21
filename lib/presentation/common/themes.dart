import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme _textTheme(TextTheme textTheme) {
    return GoogleFonts.notoSansTextTheme(textTheme);
  }

  static ThemeData get light {
    return FlexColorScheme.light(
      scheme: FlexScheme.green,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme.copyWith(
          textTheme: _textTheme(ThemeData.light().textTheme),
        );
  }

  static ThemeData get dark {
    return FlexColorScheme.dark(
      scheme: FlexScheme.green,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme.copyWith(
          textTheme: _textTheme(ThemeData.dark().textTheme),
        );
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get accentColor => theme.accentColor;
  Color get primaryColor => theme.primaryColor;
  Color get errorColor => theme.errorColor;
  Color get focusColor => theme.focusColor;
  TextStyle get bodyText1 => theme.textTheme.bodyText1!;
  TextStyle get bodyText2 => theme.textTheme.bodyText2!;
  TextStyle get headline1 => theme.textTheme.headline1!;
  TextStyle get headline2 => theme.textTheme.headline2!;
  TextStyle get headline3 => theme.textTheme.headline3!;
  TextStyle get headline4 => theme.textTheme.headline4!;
  TextStyle get headline5 => theme.textTheme.headline5!;
  TextStyle get headline6 => theme.textTheme.headline6!;
  TextStyle get subtitle1 => theme.textTheme.subtitle1!;
  TextStyle get subtitle2 => theme.textTheme.subtitle2!;
}
