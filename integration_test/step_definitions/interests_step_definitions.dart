import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final interestsStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран выбора интересов$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.interestsScreen);
      expect(interestsTestScreen.interestsScreen, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю интересы$'),
    (context, tester) async {
      await tester.scrollUntilVisible(
          interestsTestScreen.interestField("Art"), 50);
      await tester.tap(interestsTestScreen.interestField("Art"));
      await tester.scrollUntilVisible(
          interestsTestScreen.interestField("Sports"), 50);
      await tester.tap(interestsTestScreen.interestField("Sports"));
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные интересы$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.interestsScreen);
      await tester.scrollUntilVisible(find.text("Art"), 50);
      final artText = tester.widget<Text>(find.text("Art")).data;
      expect(artText, "Art");
      await tester.scrollUntilVisible(find.text("Sports"), 50);
      final sportsText = tester.widget<Text>(find.text("Sports")).data;
      expect(sportsText, "Sports");
    },
  ),
];
