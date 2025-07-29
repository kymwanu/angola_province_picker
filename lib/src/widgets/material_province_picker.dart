// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';
import '../provinces.dart';

class AngolaProvincePicker extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?>? onChanged;
  final String? hint;
  final TextStyle? style;
  final Color? dropdownColor;
  final Widget? icon;

  const AngolaProvincePicker({
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
    return DropdownButton<String>(
      value: selected,
      hint: hint != null ? Text(hint!) : null,
      style: style,
      dropdownColor: dropdownColor,
      icon: icon,
      isExpanded: true,
      items: angolaProvinces.map((String province) {
        return DropdownMenuItem(
          value: province,
          child: Text(province),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
