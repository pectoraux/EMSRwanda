// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/painting.dart';
import 'profile_fonts.dart';

const todoLineHeight = 63.0;
const appBarHeight = 63.0;
const appBarExpandedHeight = 212.0;
const appBarMinFontSize = 27.8;
const appBarMaxFontSize = 40.0;
const doneStyle = const TextStyle(
  color: TodoColors.done,
  decoration: TextDecoration.lineThrough,
);



class TodoColors {
  static const Color primaryDark = const Color(0xFF863352);
  static const Color primary = const Color(0xFFB43F54);
  static const Color primaryLight = const Color(0xFFCA4855);
  static const Color background = const Color(0xFF1C1E27);
  static const Color done = const Color(0xFFBABCBE);
  static const Color accent = const Color(0xFF42B2CC);
  static const Color disabled = const Color(0xFFBABCBE);
  static const Color line = const Color(0xFF414044);

  static final textStyle = new TextStyle(
      color: accent,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      fontFamily: ProfileFontNames.TimeBurner);

  static final textStyle2 = new TextStyle(
      color: background,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      fontFamily: ProfileFontNames.TimeBurner);

  static final textStyle3 = new TextStyle(
      color: primary,
      fontWeight: FontWeight.w900,
      fontSize: 16.0,
      fontFamily: ProfileFontNames.TimeBurner);

  static final textStyle4 = new TextStyle(
      color: accent,
      fontWeight: FontWeight.w900,
      fontSize: 13.0,
      fontFamily: ProfileFontNames.TimeBurner);

  static final textStyle5 = new TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 20.0,
      fontFamily: ProfileFontNames.TimeBurner);
}

