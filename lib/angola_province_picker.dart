/// Um seletor de províncias de Angola personalizável para Flutter.
///
/// O `AngolaProvincePicker` é um widget reutilizável que fornece uma interface
/// simples e amigável para selecionar uma das 18 províncias de Angola.
///
/// Ideal para formulários de cadastro, endereços e aplicativos voltados ao público angolano.
///
/// Recursos principais:
/// - Lista completa das províncias angolanas.
/// - Suporte a modos Material e Cupertino.
/// - Totalmente personalizável.
/// - Fácil de integrar com `Form` e `TextFormField`.
///
/// Exemplo de uso:
/// ```dart
/// AngolaProvincePicker(
///       selected: selected,
///    onChanged: (value) {
///       setState(() {
///         selected = value;
///        print(value);
///        });
///      },
///      hint: 'Escolha uma provincia',
///      dropdownColor: Colors.white,
///    ),
/// ```
///
/// Desenvolvido para facilitar a vida de desenvolvedores que constroem apps localizados.

library;

export 'src/provinces.dart';
export 'src/widgets/province_picker.dart';
