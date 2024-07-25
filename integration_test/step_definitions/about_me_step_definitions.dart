import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final aboutMeStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран данных о себе$'),
        (context, tester) async {
      await tester.pumpAndSettle();
      await tester.pumpUntilVisible(aboutMeTestScreen.aboutMeScreen);
      expect(aboutMeTestScreen.aboutMeScreen, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю информацию о себе и сохраняю данные$'),
        (context, tester) async {
      await tester.implicitEnterText(aboutMeTestScreen.aboutField, "Я люблю спать");
      await tester.tap(aboutMeTestScreen.saveBtn);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную информацию о себе$'),
        (context, tester) async {
      await tester.pumpUntilVisible(aboutMeTestScreen.aboutField);
      final aboutMe = tester.widget<TextFormField>(aboutMeTestScreen.aboutField).controller?.text;
      expect(aboutMe, "Я люблю спать");
    },
  ),
];


