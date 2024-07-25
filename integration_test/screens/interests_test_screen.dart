import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/interests_screen_strings.dart';
import 'package:profile/assets/strings/place_residence_screen_strings.dart';
import 'package:profile/assets/strings/test_keys.dart';
import 'package:profile/features/profile/screens/interests_screen/interests_screen.dart';
import 'package:profile/features/profile/screens/place_residence/place_residence_screen.dart';


class InterestsTestScreen {
  ///Экран интересов
  final Finder interestsScreen = find.byType(InterestsScreen);

  ///Выбор интересов
  Finder interestField(String interest) {
    return find.byWidgetPredicate((widget) => widget is Text && widget.data == interest);
  }


}
