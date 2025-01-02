# # Projeto Login com Flutter e Firebase 🚀

<div style="display: flex; justify-content: space-between; margin-bottom: 30px">
<img src="[https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg](https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg)" width="100">
<img src="[https://firebase.google.com/static/images/brand-guidelines/logo-vertical.png](https://firebase.google.com/static/images/brand-guidelines/logo-vertical.png)" width="50">
<img src="[https://dart.dev/assets/img/shared/dart/logo+text/horizontal/white.svg](https://dart.dev/assets/img/shared/dart/logo+text/horizontal/white.svg)" width="100">
</div>

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

```

## Configuração do Firebase

### 1. Instalação do Firebase CLI

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

### Funcionalidades Implementadas

- ✅ Tela de Login com E-mail/Senha
- ✅ Login com Google
- ✅ Tela de Registro
- ✅ Design Material 3
- ✅ Autenticação Firebase

### Estrutura do Projeto

```
lib/
  ├── screens/
  │   ├── login_screen.dart
  │   └── register_screen.dart
  ├── services/
  │   └── auth_service.dart
  └── main.dart

```

### Screenshots

[Adicionar screenshots quando disponíveis]

### Próximos Passos

- [ ]  Recuperação de senha
- [ ]  Perfil do usuário
- [ ]  Testes unitários
- [ ]  CI/CD

## 🤝 Como Contribuir

1. Fork o projeto
2. Crie sua branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT.

---

