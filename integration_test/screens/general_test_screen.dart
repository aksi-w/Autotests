import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

class GeneralTestScreen {
  /// Кнопка далее
  final Finder nextBtn = find.byType(NextButton);

  /// Общий файндер
  Finder textField(String hintText) {
    return find.byWidgetPredicate((widget) => widget is TextFormFieldWidget && widget.hintText == hintText);
  }
}
