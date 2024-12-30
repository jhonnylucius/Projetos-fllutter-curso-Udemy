# app_one

Um novo projeto Flutter.

## Introdução

Este projeto é um ponto de partida para um aplicativo Flutter.

## Recursos

Alguns recursos para ajudá-lo a começar se este for seu primeiro projeto Flutter:

- [Lab: Escreva seu primeiro aplicativo Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Exemplos úteis de Flutter](https://docs.flutter.dev/cookbook)

Para obter ajuda sobre como começar com o desenvolvimento Flutter, veja a
[documentação online](https://docs.flutter.dev/), que oferece tutoriais,
exemplos, orientações sobre desenvolvimento móvel e uma referência completa da API.

## Estrutura do Projeto

A estrutura do projeto é a seguinte:

```
Directory structure:
└── app_one/
    ├── linux/
    │   ├── runner/
    │   │   ├── main.cc
    │   │   ├── my_application.h
    │   │   ├── my_application.cc
    │   │   └── CMakeLists.txt
    │   ├── .gitignore
    │   ├── flutter/
    │   │   ├── generated_plugin_registrant.cc
    │   │   ├── generated_plugins.cmake
    │   │   ├── CMakeLists.txt
    │   │   └── generated_plugin_registrant.h
    │   └── CMakeLists.txt
    ├── .gitignore
    ├── ios/
    │   ├── .gitignore
    │   ├── Runner/
    │   │   ├── AppDelegate.swift
    │   │   ├── Base.lproj/
    │   │   │   ├── Main.storyboard
    │   │   │   └── LaunchScreen.storyboard
    │   │   ├── Assets.xcassets/
    │   │   │   ├── AppIcon.appiconset/
    │   │   │   │   └── Contents.json
    │   │   │   └── LaunchImage.imageset/
    │   │   │       ├── README.md
    │   │   │       └── Contents.json
    │   │   ├── Runner-Bridging-Header.h
    │   │   └── Info.plist
    │   ├── Flutter/
    │   │   ├── Debug.xcconfig
    │   │   ├── Release.xcconfig
    │   │   └── AppFrameworkInfo.plist
    │   ├── Runner.xcodeproj/
    │   │   ├── project.xcworkspace/
    │   │   │   ├── contents.xcworkspacedata
    │   │   │   └── xcshareddata/
    │   │   │       ├── IDEWorkspaceChecks.plist
    │   │   │       └── WorkspaceSettings.xcsettings
    │   │   ├── project.pbxproj
    │   │   └── xcshareddata/
    │   │       └── xcschemes/
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace/
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata/
    │   │       ├── IDEWorkspaceChecks.plist
    │   │       └── WorkspaceSettings.xcsettings
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── test/
    │   └── widget_test.dart
    ├── pubspec.yaml
    ├── lib/
    │   └── main.dart
    ├── analysis_options.yaml
    ├── windows/
    │   ├── runner/
    │   │   ├── utils.cpp
    │   │   ├── win32_window.h
    │   │   ├── resources/
    │   │   ├── utils.h
    │   │   ├── win32_window.cpp
    │   │   ├── flutter_window.h
    │   │   ├── flutter_window.cpp
    │   │   ├── CMakeLists.txt
    │   │   ├── main.cpp
    │   │   ├── runner.exe.manifest
    │   │   ├── Runner.rc
    │   │   └── resource.h
    │   ├── .gitignore
    │   ├── flutter/
    │   │   ├── generated_plugin_registrant.cc
    │   │   ├── generated_plugins.cmake
    │   │   ├── CMakeLists.txt
    │   │   └── generated_plugin_registrant.h
    │   └── CMakeLists.txt
    ├── macos/
    │   ├── .gitignore
    │   ├── Runner/
    │   │   ├── AppDelegate.swift
    │   │   ├── Base.lproj/
    │   │   │   └── MainMenu.xib
    │   │   ├── Configs/
    │   │   │   ├── Debug.xcconfig
    │   │   │   ├── Release.xcconfig
    │   │   │   ├── Warnings.xcconfig
    │   │   │   └── AppInfo.xcconfig
    │   │   ├── Release.entitlements
    │   │   ├── MainFlutterWindow.swift
    │   │   ├── DebugProfile.entitlements
    │   │   ├── Assets.xcassets/
    │   │   │   └── AppIcon.appiconset/
    │   │   │       └── Contents.json
    │   │   └── Info.plist
    │   ├── Flutter/
    │   │   ├── GeneratedPluginRegistrant.swift
    │   │   ├── Flutter-Debug.xcconfig
    │   │   └── Flutter-Release.xcconfig
    │   ├── Runner.xcodeproj/
    │   │   ├── project.xcworkspace/
    │   │   │   └── xcshareddata/
    │   │   │       └── IDEWorkspaceChecks.plist
    │   │   ├── project.pbxproj
    │   │   └── xcshareddata/
    │   │       └── xcschemes/
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace/
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata/
    │   │       └── IDEWorkspaceChecks.plist
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── android/
    │   ├── gradle.properties
    │   ├── .gitignore
    │   ├── gradle/
    │   │   └── wrapper/
    │   │       └── gradle-wrapper.properties
    │   └── app/
    │       └── src/
    │           ├── main/
    │           │   ├── AndroidManifest.xml
    │           │   ├── res/
    │           │   │   ├── mipmap-mdpi/
    │           │   │   ├── mipmap-xxxhdpi/
    │           │   │   ├── mipmap-hdpi/
    │           │   │   ├── mipmap-xxhdpi/
    │           │   │   ├── drawable/
    │           │   │   │   └── launch_background.xml
    │           │   │   ├── mipmap-xhdpi/
    │           │   │   ├── drawable-v21/
    │           │   │   │   └── launch_background.xml
    │           │   │   ├── values-night/
    │           │   │   │   └── styles.xml
    │           │   │   └── values/
    │           │   │       └── styles.xml
    │           │   └── kotlin/
    │           │       └── com/
    │           │           └── example/
    │           │               └── app_one/
    │           │                   └── MainActivity.kt
    │           ├── debug/
    │           │   └── AndroidManifest.xml
    │           └── profile/
    │               └── AndroidManifest.xml
    ├── web/
    │   ├── manifest.json
    │   ├── index.html
    │   └── icons/
    ├── .metadata
    └── README.md
```

## Como Executar

Para executar este projeto, siga os passos abaixo:

1. Certifique-se de ter o Flutter instalado. Para mais informações, consulte a [documentação do Flutter](https://docs.flutter.dev/get-started/install).
2. Navegue até o diretório do projeto.
3. Execute o comando `flutter pub get` para obter as dependências.
4. Execute o comando `flutter run` para iniciar o aplicativo.

## Testes

Para executar os testes, use o comando:

```
flutter test
```

Contribuição
Se você quiser contribuir para este projeto, sinta-se à vontade para abrir um pull request ou relatar problemas no repositório.

Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.