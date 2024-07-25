import 'package:flutter/widgets.dart';

abstract class TestKeys {
  /// Поле выбора даты рождения.
  static const dateOfBirthField = ValueKey('dateOfBirthField');

  /// Поле ввода адреса
  static const placeOfResidenceField = ValueKey('placeOfResidenceField');

  ///Поле ввода информации о себе
  static const aboutMeField = ValueKey("aboutMeField");

  ///Кнопка на экране "О себе"
  static const saveBtn = ValueKey("saveBtn");
}