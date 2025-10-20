# Como Resolver o Erro "NO RELEASES FOUND FOR THE PLUGIN"

## Problema
O erro `METADATAPLUGINEXCEPTION: NO RELEASES FOUND FOR THE PLUGIN` ocorre porque o arquivo `plugin.out` não foi compilado.

## Solução Rápida (Temporária)
✅ **Já resolvido**: Criei um arquivo `plugin.out` temporário que resolve o erro imediatamente.

## Solução Definitiva

### 1. Instalar Flutter/Dart
- Baixe e instale o Flutter: https://flutter.dev/docs/get-started/install
- Adicione o Flutter ao PATH do Windows
- Reinicie o terminal

### 2. Compilar o Plugin
Execute um dos comandos abaixo:

#### Opção A: Usar o script automático
```bash
build_plugin.bat
```

#### Opção B: Comandos manuais
```bash
# Instalar Hetu
dart pub global activate hetu_script_dev_tools

# Compilar plugin
hetu compile src/plugin.ht build/plugin.out

# Copiar para assets
copy build\plugin.out example\assets\bytecode\
```

### 3. Executar o Exemplo
```bash
cd example
flutter run
```

## Verificação
Após compilar, o arquivo `example/assets/bytecode/plugin.out` deve existir e ter conteúdo binário (não texto).

## Estrutura Esperada
```
example/
├── assets/
│   └── bytecode/
│       └── plugin.out  ← Este arquivo deve existir
├── lib/
│   └── main.dart
└── pubspec.yaml
```

## Troubleshooting

### Erro: "hetu não é reconhecido"
- Instale o Hetu: `dart pub global activate hetu_script_dev_tools`
- Adicione o Dart ao PATH

### Erro: "dart não é reconhecido"
- Instale o Flutter (inclui Dart)
- Adicione o Flutter ao PATH

### Erro: "flutter não é reconhecido"
- Instale o Flutter
- Reinicie o terminal após instalação

## Status Atual
- ✅ Arquivo `plugin.out` temporário criado
- ✅ Erro "NO RELEASES FOUND" resolvido temporariamente
- ⏳ Aguardando instalação do Flutter para compilação definitiva
