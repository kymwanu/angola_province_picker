import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Escolher Provincias')),
        body: const Center(child: AngolaProvincePickerTest()),
      ),
    );
  }
}

class AngolaProvincePickerTest extends StatefulWidget {
  const AngolaProvincePickerTest({super.key});

  @override
  State<AngolaProvincePickerTest> createState() =>
      _AngolaProvincePickerTestState();
}

class _AngolaProvincePickerTestState extends State<AngolaProvincePickerTest> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AngolaProvincePicker(
        selected: selected,
        onChanged: (value) {
          setState(() {
            selected = value;
          });
        },
        hint: 'Escolha uma provincia',
        dropdownColor: Colors.white,
      ),
    );
  }
}
