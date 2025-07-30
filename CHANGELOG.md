# Changelog

Todas as mudanças importantes deste pacote serão documentadas aqui.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/), e este projeto segue a [Semantic Versioning](https://semver.org/lang/pt-BR/).

---

## [1.1.0] - 2025-07-30

### Adicionado
- Suporte ao modo Cupertino (`CupertinoPicker`) para selecionar províncias e municípios.
- Widget `AngolaTownPicker` para selecionar municípios com base na província.
- Exemplo completo com alternância entre Material e Cupertino.
- Campo `icon` e `dropdownColor` no `CupertinoProvincePicker`.

## [1.1.1] - 2025-07-29
### Corrigido
- Corrigido pubspec.yaml (URLs, environment, lints)
- Adicionado diretório `example/`
- Corrigido erro de exportações faltantes

### Melhorado
- Adicionados estilos com borda nos `DropdownButtonFormField` para integração mais natural com formulários.
- Código organizado e formatado com `dart format`.

---

## [1.0.0] - 2025-07-28

### Adicionado
- Primeira versão estável do pacote.
- Widget `AngolaProvincePicker` com lista completa das 18 províncias de Angola.
- Suporte ao modo Material.
- Callback `onChanged` para capturar a província selecionada.
- Personalização do texto do hint (`hintText`).

---

## [0.0.1] - 2025-07-25

### Adicionado
- Estrutura inicial do pacote criada.
- README, LICENSE e suporte básico.
