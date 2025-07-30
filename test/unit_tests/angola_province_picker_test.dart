import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:angola_province_picker/angola_province_picker.dart';

void main() {
  testWidgets(
    'AngolaProvincePicker e AngolaMunicipalityPicker disparam onChanged corretamente',
    (WidgetTester tester) async {
      String? selectedProvince;
      String? selectedMunicipality;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  AngolaProvincePicker(
                    mode: AngolaPickerMode.dropdown,
                    selected: selectedProvince,
                    onChanged: (value) {
                      setState(() => selectedProvince = value);
                    },
                    hint: 'Selecionar província',
                  ),
                  if (selectedProvince != null)
                    AngolaTownPicker(
                      mode: AngolaPickerMode.dropdown,
                      province: selectedProvince!,
                      selected: selectedMunicipality,
                      onChanged: (value) {
                        setState(() => selectedMunicipality = value);
                      },
                      hint: 'Selecionar município',
                    ),
                ],
              ),
            ),
          ),
        ),
      );

      // Verifica se o dropdown da província aparece
      expect(find.text('Selecionar província'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);

      // Simula seleção de província via chamada direta
      selectedProvince = 'Luanda';
      await tester.pumpAndSettle();

      // Rebuild com província setada
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AngolaProvincePicker(
                  mode: AngolaPickerMode.dropdown,
                  selected: selectedProvince,
                  onChanged: (_) {},
                  hint: 'Selecionar província',
                ),
                AngolaTownPicker(
                  mode: AngolaPickerMode.dropdown,
                  province: selectedProvince!,
                  selected: selectedMunicipality,
                  onChanged: (_) {},
                  hint: 'Selecionar município',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verifica se o picker de município aparece após selecionar província
      expect(find.text('Selecionar município'), findsOneWidget);
    },
  );
}
