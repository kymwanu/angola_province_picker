import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/material.dart';

/// Picker de províncias com estilo Material (Dropdown).
///
/// Mostra uma lista suspensa com as 18 províncias de Angola.
/// Pode ser usado em apps com design Android/Material.
class MaterialProvincePicker extends StatelessWidget {
  /// Província selecionada.
  final String? selected;

  /// Função chamada ao alterar a seleção.
  final ValueChanged<String?>? onChanged;

  /// Texto de dica exibido quando nada está selecionado.
  final String? hint;

  /// Estilo do texto da seleção.
  final TextStyle? style;

  /// Cria um [MaterialProvincePicker].
  const MaterialProvincePicker({
    super.key,
    this.selected,
    required this.onChanged,
    this.hint,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selected,
      hint: Text(hint ?? 'Selecionar província'),
      style: style,
      isExpanded: true,
      items: angolaProvinces
          .map((p) => DropdownMenuItem(value: p, child: Text(p)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
