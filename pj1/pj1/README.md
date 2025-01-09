# # Projeto Login email/senha e gmail com Flutter, Dart e Firebase 🚀

<div style="display: flex; justify-content: space-between; margin-bottom: 30px">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg" width="40px" alt="Flutter"/>
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg" width="40px" alt="Firebase"/>
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg" width="40px" alt="Dart"/>
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg" width="35px" alt="gmail"/>
  
</div>

## 🎥 Demonstração
[![Demonstração do App](https://img.youtube.com/vi/mF_-gHBVBqQ/0.jpg)](https://www.youtube.com/shorts/mF_-gHBVBqQ)

## 📋 Índice

1. Configuração do Ambiente
2. Configuração do VS Code
3. Configuração do Firebase
4. Sobre o Projeto

## Configuração do Ambiente

### 1. Instalação do Flutter

```bash
# 1. Baixe o Flutter SDK em <https://flutter.dev/docs/get-started/install/windows>
# 2. Extraia o arquivo zip em C:\\src\\flutter
# 3. Adicione ao Path do sistema:
C:\\src\\flutter\\bin

```

### 2. Instalação do Android Studio

```bash
# 1. Baixe em <https://developer.android.com/studio>
# 2. Instale apenas para SDK e Emulador
# 3. No Android Studio, instale:
# - Android SDK
# - Android SDK Command-line Tools
# - Android Emulator

```

### 3. Aceitar licenças Android

```bash
flutter doctor --android-licenses

```

## Configuração do VS Code

### Extensões Necessárias

- Flutter
- Dart
- Firebase Extension
- Material Icon Theme
- Flutter Widget Snippets

### Dependências do Projeto

```bash
flutter pub add flutter_signin_button
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add google_sign_in
flutter pub add cloud_firestore
flutter pub add firebase_messaging
flutter pub add http
flutter pub add mask_text_input_formatter
flutter pub add uuid
flutter pub logger
flutter pub fl_chart
flutter pub intl

```
## erros conhecidos

- ao rodar o flutter run e der um erro dizendo que você esta usando uma versão "21 do minSdk", basta passar para "minSdk = 23", no arquivo <android/app/build.gradle>. 


## Configuração do Firebase

### 1. Instalação do Firebase CLI - instale o node-js para usar os comandos npm

```bash
npm install -g firebase-tools

```

### 2. Configuração do Projeto

```bash
# Login no Firebase
firebase login

# Inicializar Firebase no projeto
flutterfire configure

# Selecionar plataformas
flutter create --platforms android,web .

```

## Sobre o Projeto

# Funcionalidades Disponíveis no Aplicativo

## Autenticação
- 🔐 **Login com E-mail/Senha**: Permite que os usuários façam login usando suas credenciais de e-mail e senha.
- 🔑 **Login com Google**: Integração com o Google Sign-In para permitir que os usuários façam login usando suas contas do Google.
- 📝 **Registro de Nova Conta**: Permite que novos usuários se registrem no aplicativo criando uma conta com e-mail e senha.
- 🔄 **Redefinir Senha**: Funcionalidade para os usuários redefinirem suas senhas caso as esqueçam.

## Gerenciamento de Dados
- ✅ **Atualizar e Salvar Dados**: Permite que os usuários atualizem e salvem informações no banco de dados.
- ❌ **Excluir Dados**: Funcionalidade para excluir dados armazenados no banco de dados.
- 🗑️ **Excluir Conta**: Permite que os usuários excluam suas contas do aplicativo.

## Interface do Usuário
- 🎨 **Design Material 3**: Utiliza o Material Design 3 para uma interface moderna e intuitiva.
- 📊 **Dashboard**: Tela de dashboard que exibe informações resumidas e gráficos sobre despesas e receitas.
- 📅 **Gerenciamento de Despesas**: Tela para registrar, atualizar e excluir despesas.
- 💰 **Gerenciamento de Receitas**: Tela para registrar, atualizar e excluir receitas.

## Notificações
- 📬 **Firebase Messaging**: Integração com o Firebase Cloud Messaging para envio de notificações push.


## Outros
- 🌐 **Suporte Multiplataforma**: Suporte para Android e Web.
- 📈 **Gráficos**: Utilização da biblioteca `fl_chart` para exibição de gráficos no dashboard.

---

### Estrutura do Projeto

```
Directory structure:
└── pj1/
    ├── README.md
    ├── analysis_options.yaml
    ├── pubspec.yaml
    ├── .gitignore
    ├── .metadata
    ├── android/
    │   ├── gradle.properties
    │   ├── .gitignore
    │   ├── app/
    │   │   └── src/
    │   │       ├── debug/
    │   │       │   └── AndroidManifest.xml
    │   │       ├── main/
    │   │       │   ├── AndroidManifest.xml
    │   │       │   ├── kotlin/
    │   │       │   │   └── com/
    │   │       │   │       └── example/
    │   │       │   │           └── pj1/
    │   │       │   │               └── MainActivity.kt
    │   │       │   └── res/
    │   │       │       ├── drawable/
    │   │       │       │   └── launch_background.xml
    │   │       │       ├── drawable-v21/
    │   │       │       │   └── launch_background.xml
    │   │       │       ├── mipmap-hdpi/
    │   │       │       ├── mipmap-mdpi/
    │   │       │       ├── mipmap-xhdpi/
    │   │       │       ├── mipmap-xxhdpi/
    │   │       │       ├── mipmap-xxxhdpi/
    │   │       │       ├── values/
    │   │       │       │   └── styles.xml
    │   │       │       └── values-night/
    │   │       │           └── styles.xml
    │   │       └── profile/
    │   │           └── AndroidManifest.xml
    │   └── gradle/
    │       └── wrapper/
    │           └── gradle-wrapper.properties
    ├── assets/
    ├── lib/
    │   ├── main.dart
    │   ├── components/
    │   │   └── menu.dart
    │   ├── helpers/
    │   │   └── hour_helpers.dart
    │   ├── models/
    │   │   ├── costs.dart
    │   │   └── expenses.dart
    │   ├── screens/
    │   │   ├── costs_screen.dart
    │   │   ├── dashBoard_screen.dart
    │   │   ├── expenses_screen.dart
    │   │   ├── home_screen.dart
    │   │   ├── login_screen.dart
    │   │   ├── register_screen.dart
    │   │   └── reset_password_modal.dart
    │   └── services/
    │       └── auth_service.dart
    ├── test/
    │   └── widget_test.dart
    ├── web/
    │   ├── index.html
    │   ├── manifest.json
    │   └── icons/
    └── .vscode/
        └── settings.json


```

### Screenshots

[Adicionar screenshots quando disponíveis]


## 🤝 Como Contribuir

1. Fork o projeto
2. Crie sua branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT.

---

# 🔥Como Utilizar o App

## Pré-requisitos

- Flutter SDK instalado
- Git instalado
- Node.js instalado
- Android Studio (apenas para SDK e emulador) ou dispositivo físico
- VS Code com extensões Flutter e Dart

## Passo a Passo

### 1. Clone o Repositório

```bash
git clone <[https://github.com/jhonnylucius/pj1/pj1.git](https://github.com/jhonnylucius/Projetos-fllutter-curso-Udemy.git)>
cd pj1

```

### 2. Instale as Dependências

```bash
flutter pub get

```

### 3. Configure o Firebase

```bash
# Certifique-se de ter o Firebase CLI instalado
npm install -g firebase-tools

# Faça login no Firebase
firebase login

# Configure o projeto
flutterfire configure

```

### 4. Execute o App

```bash
# Para dispositivo físico Android conectado via USB
flutter run

# Para emulador
flutter emulators --launch <emulator_id>
flutter run

```

# Funcionalidades Disponíveis no Aplicativo

## Autenticação
- 🔐 **Login com E-mail/Senha**: Permite que os usuários façam login usando suas credenciais de e-mail e senha.
- 🔑 **Login com Google**: Integração com o Google Sign-In para permitir que os usuários façam login usando suas contas do Google.
- 📝 **Registro de Nova Conta**: Permite que novos usuários se registrem no aplicativo criando uma conta com e-mail e senha.
- 🔄 **Redefinir Senha**: Funcionalidade para os usuários redefinirem suas senhas caso as esqueçam.

## Gerenciamento de Dados
- ✅ **Atualizar e Salvar Dados**: Permite que os usuários atualizem e salvem informações no banco de dados.
- ❌ **Excluir Dados**: Funcionalidade para excluir dados armazenados no banco de dados.
- 🗑️ **Excluir Conta**: Permite que os usuários excluam suas contas do aplicativo.

## Interface do Usuário
- 🎨 **Design Material 3**: Utiliza o Material Design 3 para uma interface moderna e intuitiva.
- 📊 **Dashboard**: Tela de dashboard que exibe informações resumidas e gráficos sobre despesas e receitas.
- 📅 **Gerenciamento de Despesas**: Tela para registrar, atualizar e excluir despesas.
- 💰 **Gerenciamento de Receitas**: Tela para registrar, atualizar e excluir receitas.

## Notificações
- 📬 **Firebase Messaging**: Integração com o Firebase Cloud Messaging para envio de notificações push.


## Outros
- 🌐 **Suporte Multiplataforma**: Suporte para Android e Web.
- 📈 **Gráficos**: Utilização da biblioteca `fl_chart` para exibição de gráficos no dashboard.

---


## Troubleshooting

- Certifique-se que o dispositivo está conectado (`flutter devices`)
- Verifique se todas as dependências estão instaladas (`flutter doctor`)
- Para problemas com Firebase, verifique se `google-services.json` está presente

---

⭐ Se este projeto ajudou você, considere dar uma estrela no repositório!
