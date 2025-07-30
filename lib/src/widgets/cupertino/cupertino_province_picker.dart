import 'package:angola_province_picker/src/models/provinces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Picker de províncias no estilo Cupertino (iOS).
///
/// Exibe um modal de seleção com as províncias de Angola.
class CupertinoProvincePicker extends StatelessWidget {
  /// Província selecionada.
  final String? selected;

  /// Função chamada ao selecionar uma província.
  final ValueChanged<String> onChanged;

  /// Texto de dica mostrado no campo.
  final String? hint;

  /// Estilo do texto.
  final TextStyle? style;

  /// Cor do fundo do modal.
  final Color? dropdownColor;

  /// Ícone exibido à direita do campo.
  final Widget? icon;

  /// Cria um [CupertinoProvincePicker].
  const CupertinoProvincePicker({
    super.key,
    this.selected,
    required this.onChanged,
    this.hint,
    this.style,
    this.dropdownColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final int initialIndex = selected != null
        ? angolaProvinces.indexOf(selected!)
        : 0;

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
            color: dropdownColor ?? Colors.white,
            height: 250,
            child: CupertinoPicker(
              itemExtent: 32,
              scrollController: FixedExtentScrollController(
                initialItem: initialIndex,
              ),
              onSelectedItemChanged: (index) {
                onChanged(angolaProvinces[index]);
              },
              children: angolaProvinces
                  .map(
                    (e) => Text(
                      e,
                      style:
                          style ??
                          const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selected ?? hint ?? 'Selecionar uma província',
                style:
                    style ??
                    TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context).textTheme.bodyLarge?.color ??
                          Colors.black,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            icon ?? const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
