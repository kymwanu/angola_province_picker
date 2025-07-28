import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:angola_province_picker/angola_province_picker.dart';

void main() {
  testWidgets('AngolaProvincePicker displays and selects a province', (
    WidgetTester tester,
  ) async {
    String? selectedProvince;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AngolaProvincePicker(
            selected: null,
            hint: 'Selecione uma provincia',
            onChanged: (value) {
              selectedProvince = value;
            },
          ),
        ),
      ),
    );

    expect(find.text('Selecione uma provincia'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Bengo').last);
    await tester.pumpAndSettle();

    expect(selectedProvince, 'Bengo');
  });
}
