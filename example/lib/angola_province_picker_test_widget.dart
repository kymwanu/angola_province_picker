import 'package:flutter/material.dart';
import 'package:angola_province_picker/angola_province_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Picker de Províncias')),
        body: const Center(child: ProvincePickerDemo()),
      ),
    );
  }
}

class ProvincePickerDemo extends StatefulWidget {
  const ProvincePickerDemo({super.key});
  @override
  State<ProvincePickerDemo> createState() => _ProvincePickerDemoState();
}

class _ProvincePickerDemoState extends State<ProvincePickerDemo> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AngolaProvincePicker(
        selected: selected,
        onChanged: (value) {
          setState(() {
            selected = value;
          });
        },
        hint: 'Escolha uma província',
      ),
    );
  }
}
