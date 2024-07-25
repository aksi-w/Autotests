import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/about_me_screen_strings.dart';
import 'package:profile/assets/strings/test_keys.dart';
import 'package:profile/features/profile/screens/about_me_screen/about_me_screen.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';

class AboutMeTestScreen {
  ///Экран о себе
  final Finder aboutMeScreen = find.byType(AboutMeScreen);

  ///Поле информации о себе
  final Finder aboutField = find.byKey(TestKeys.aboutMeField);

  ///Кнопка на экране "О себе"
  final Finder saveBtn = find.byKey(TestKeys.saveBtn);


}
