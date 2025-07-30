import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/material.dart';

/// Um widget de seleção de províncias de Angola.
///
/// Este widget exibe um dropdown ou um picker no estilo iOS (Cupertino)
/// com a lista de províncias angolanas.
class AngolaProvincePicker extends StatelessWidget {
  /// Modo do picker: [AngolaPickerMode.dropdown] ou [AngolaPickerMode.cupertino].
  final AngolaPickerMode mode;

  /// Província atualmente selecionada.
  final String? selected;

  /// Função chamada quando a província selecionada muda.
  final ValueChanged<String?> onChanged;

  /// Texto de dica (placeholder) mostrado no picker.
  final String? hint;

  /// Estilo do texto do picker.
  final TextStyle? style;

  /// Cria um novo widget de seleção de províncias.
  const AngolaProvincePicker({
    super.key,
    required this.mode,
    this.selected,
    required this.onChanged,
    this.hint,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return mode == AngolaPickerMode.cupertino
        ? CupertinoProvincePicker(
            selected: selected,
            onChanged: onChanged,
            hint: hint,
            style: style,
          )
        : MaterialProvincePicker(
            selected: selected,
            onChanged: onChanged,
            hint: hint,
            style: style,
          );
  }
}
