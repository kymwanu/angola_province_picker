import 'package:flutter/material.dart';
import 'package:angola_province_picker/angola_province_picker.dart';

void main() {
  runApp(const MyApp());
}

/// Exemplo de uso do pacote angola_province_picker com suporte aos modos
/// Material (Dropdown) e Cupertino (iOS).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angola Province Picker Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PickerDemoPage(),
    );
  }
}

class PickerDemoPage extends StatefulWidget {
  const PickerDemoPage({super.key});

  @override
  State<PickerDemoPage> createState() => _PickerDemoPageState();
}

class _PickerDemoPageState extends State<PickerDemoPage> {
  AngolaPickerMode _mode = AngolaPickerMode.dropdown;
  String? selectedProvince;
  String? selectedTown;

  void _switchMode() {
    setState(() {
      _mode = _mode == AngolaPickerMode.dropdown
          ? AngolaPickerMode.cupertino
          : AngolaPickerMode.dropdown;
      // Reset ao alternar o modo
      selectedProvince = null;
      selectedTown = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCupertino = _mode == AngolaPickerMode.cupertino;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Selecionar Província e Município',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: isCupertino
                ? 'Mudar para Dropdown'
                : 'Mudar para Cupertino',
            icon: Icon(
              isCupertino ? Icons.android : Icons.phone_iphone,
              size: 40,
            ),
            onPressed: _switchMode,
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            SizedBox(height: 100),
            AngolaProvincePicker(
              mode: _mode,
              selected: selectedProvince,
              hint: 'Escolha uma província',
              onChanged: (value) {
                setState(() {
                  selectedProvince = value;
                  selectedTown = null;
                });
              },
            ),
            const SizedBox(height: 24),
            if (selectedProvince != null)
              AngolaTownPicker(
                mode: _mode,
                province: selectedProvince!,
                selected: selectedTown,
                hint: 'Escolha um município',
                onChanged: (value) {
                  setState(() {
                    selectedTown = value;
                  });
                },
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
