// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/colors.dart';
import 'package:Shrine/model/product.dart';
import 'package:Shrine/supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'backdrop.dart';
import 'category_menu_page.dart';

/**
 *  Dreamwalker 
 */

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  @override
  ShrineAppState createState() {
    return new ShrineAppState();
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

class ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
//      home: HomePage(),
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory,),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
//        backLayer: Container(
//          color: kShrinePink100,
//        ),
        frontTitle: Text('Shrine'),
        backTitle: Text('Menu'),
      ),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: widget._getRoute,
      theme: _kShrineTheme,
      // TODO: Add a theme (103)
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonColor: kShrinePink100,
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      // TODO: Add the text themes (103)
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      // TODO: Add the icon themes (103)
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      )
//    inputDecorationTheme: InputDecorationTheme(
//      border: OutlineInputBorder(),
//    ),
      // TODO: Decorate the inputs (103)

      );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

//ThemeData _buildShrineTheme() {
//  final ThemeData base = ThemeData.dark();
//  return base.copyWith(
//    accentColor: kShrineAltDarkGrey,
//    primaryColor: kShrineAltDarkGrey,
//    buttonColor: kShrineAltYellow,
//    scaffoldBackgroundColor: kShrineAltDarkGrey,
//    cardColor: kShrineAltDarkGrey,
//    textSelectionColor: kShrinePink100,
//    errorColor: kShrineErrorRed,
//    textTheme: _buildShrineTextTheme(base.textTheme),
//    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
//    primaryIconTheme: base.iconTheme.copyWith(
//        color: kShrineAltYellow
//    ),
//    inputDecorationTheme: InputDecorationTheme(
//      border: CutCornersBorder(),
//    ),
//  );
//}
//
//TextTheme _buildShrineTextTheme(TextTheme base) {
//  return base.copyWith(
//    headline: base.headline.copyWith(
//      fontWeight: FontWeight.w500,
//    ),
//    title: base.title.copyWith(
//        fontSize: 18.0
//    ),
//    caption: base.caption.copyWith(
//      fontWeight: FontWeight.w400,
//      fontSize: 14.0,
//    ),
//  ).apply(
//    fontFamily: 'Rubik',
//    displayColor: kShrineSurfaceWhite,
//    bodyColor: kShrineSurfaceWhite,
//  );
//}
