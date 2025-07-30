import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/material.dart';

/// Um widget de seleção de municípios de Angola com base na província selecionada.
class AngolaTownPicker extends StatelessWidget {
  /// Modo do picker: Cupertino ou Dropdown.
  final AngolaPickerMode mode;

  /// Nome da província cujos municípios serão exibidos.
  final String province;

  /// Município atualmente selecionado.
  final String? selected;

  /// Função chamada quando o município selecionado muda.
  final ValueChanged<String?> onChanged;

  /// Texto de dica (placeholder) mostrado no picker.
  final String? hint;

  /// Estilo do texto do picker.
  final TextStyle? style;

  /// Cria um novo widget de seleção de municípios.
  const AngolaTownPicker({
    super.key,
    required this.mode,
    required this.province,
    required this.onChanged,
    this.selected,
    this.hint,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return mode == AngolaPickerMode.cupertino
        ? CupertinoTownPicker(
            province: province,
            selected: selected,
            onChanged: onChanged,
            hint: hint,
            style: style,
          )
        : MaterialTownPicker(
            province: province,
            selected: selected,
            onChanged: onChanged,
            hint: hint,
            style: style,
          );
  }
}
