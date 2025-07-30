import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/material.dart';

/// Picker de municípios com estilo Material (Dropdown).
///
/// Mostra os municípios da província selecionada.
class MaterialTownPicker extends StatelessWidget {
  /// Nome da província cujos municípios devem ser exibidos.
  final String province;

  /// Município selecionado.
  final String? selected;

  /// Função chamada ao alterar a seleção.
  final ValueChanged<String?>? onChanged;

  /// Texto de dica exibido quando nada está selecionado.
  final String? hint;

  /// Estilo do texto da seleção.
  final TextStyle? style;

  /// Cria um [MaterialTownPicker].
  const MaterialTownPicker({
    super.key,
    required this.province,
    this.selected,
    required this.onChanged,
    this.hint,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> towns = angolaTowns[province] ?? [];
    return DropdownButton<String>(
      value: selected,
      hint: hint != null ? Text(hint!) : const Text('Selecionar um município'),
      style: style,
      items: towns.map((String m) {
        return DropdownMenuItem(value: m, child: Text(m));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
