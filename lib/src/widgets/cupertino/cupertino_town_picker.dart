import 'package:angola_province_picker/angola_province_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Picker de municípios no estilo Cupertino (iOS).
///
/// Exibe um modal de seleção com os municípios da província informada.
class CupertinoTownPicker extends StatelessWidget {
  /// Nome da província cujos municípios serão listados.
  final String province;

  /// Município atualmente selecionado.
  final String? selected;

  /// Função chamada ao alterar a seleção.
  final ValueChanged<String> onChanged;

  /// Texto de dica exibido quando nada está selecionado.
  final String? hint;

  /// Estilo do texto mostrado.
  final TextStyle? style;

  /// Cria um [CupertinoTownPicker].
  const CupertinoTownPicker({
    super.key,
    required this.province,
    required this.onChanged,
    this.selected,
    this.hint,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> municipios = angolaTowns[province] ?? [];
    final int initialIndex = selected != null
        ? municipios.indexOf(selected!)
        : 0;

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
            height: 250,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: initialIndex,
              ),
              itemExtent: 32,
              onSelectedItemChanged: (index) => onChanged(municipios[index]),
              children: municipios.map(Text.new).toList(),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          selected ?? hint ?? 'Selecionar município',
          style: style ?? const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
