import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/personal_data_screen_strings.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
        (context, tester) async {
      final surnameField = generalTestScreen.textField(PersonalDataScreenStrings.surnameHint);
      await tester.implicitEnterText(surnameField, "Gosling");
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
        (context, tester) async {
      final dateField = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      dateField.controller?.text = '2000-01-01';
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
        (context, tester) async {
      final nameField = generalTestScreen.textField(PersonalDataScreenStrings.nameTitle);
      await tester.implicitEnterText(nameField, "Ryan");
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
        (context, tester) async {
      final secondNameField = generalTestScreen.textField(PersonalDataScreenStrings.secondNameHint);
      await tester.implicitEnterText(secondNameField, "Nikolaevich");
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные ФИО$'),
        (context, tester) async {
      final surnameField = generalTestScreen.textField(PersonalDataScreenStrings.surnameHint);
      await tester.pumpUntilVisible(surnameField);
      final surname = tester.widget<TextFormFieldWidget>(surnameField).controller?.text;
      expect(surname, "Gosling");

      final nameField = generalTestScreen.textField(PersonalDataScreenStrings.nameTitle);
      await tester.pumpUntilVisible(nameField);
      final name = tester.widget<TextFormFieldWidget>(nameField).controller?.text;
      expect(name, "Ryan");

      final secondNameField = generalTestScreen.textField(PersonalDataScreenStrings.secondNameHint);
      await tester.pumpUntilVisible(secondNameField);
      final secondName = tester.widget<TextFormFieldWidget>(secondNameField).controller?.text;
      expect(secondName, "Nikolaevich");
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную дату рождения$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.dateOfBirthField);
      final birthday = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField).controller?.text;
      expect(birthday, "2000-01-01");
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу ошибку в поле дня рождения$'),
        (context, tester) async {
      final dateField = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      expect(dateField.controller?.text, isEmpty);

      final error = find.descendant(
        of: personalDataTestScreen.dateOfBirthField,
        matching: find.text('This field must be filled'),
      );
      expect(error, findsOneWidget);
    },
  ),
];
