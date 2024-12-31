import 'package:flutter/material.dart';

void main() {
  // Função principal
  runApp(const MyApp());
} // runApp

class MyApp extends StatelessWidget {
  // Classe principal
  const MyApp({super.key}); // Construtor

  @override // Construtor
  Widget build(BuildContext context) {
    // Construtor
    return MaterialApp(
      // Aplicativo
      debugShowCheckedModeBanner: false, // Debug
      title: 'Flutter App', // Título
      theme: ThemeData(
        // Título
        primarySwatch: Colors.blue, // Cor principal
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // Densidade visual
      ),
      home: const MyHomePage(), // Página inicial
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Página principal
  const MyHomePage({super.key}); // Construtor

  @override // Construtor
  Widget build(BuildContext context) {
    // Construtor
    return Scaffold(
      // Estrutura da página
      body: Stack(
        // Pilha de widgets
        children: [
          // Lista de widgets
          // Imagem de fundo
          Container(
            // Container
            decoration: const BoxDecoration(
              // Decoração
              image: DecorationImage(
                // Imagem de fundo
                image: NetworkImage(
                    'https://union.dev.br/assets/fundoVertical.jpeg'), // Imagem
                fit: BoxFit.cover, // Ajuste
              ),
            ),
          ),
          // Conteúdo principal
          Center(
            // Centraliza o conteúdo
            child: Column(
              // Coluna de widgets
              mainAxisAlignment: MainAxisAlignment.center, // Alinhamento
              children: [
                Image.network(
                  'https://union.dev.br/assets/fundoVertical.jpeg',
                  scale: 1.0,
                ),
                // Lista de widgets
                // Título estilizado
                const Text(
                  // Texto
                  'Divertindo com Flutter', // Texto
                  style: TextStyle(
                    // Estilo do texto
                    fontSize: 32, // Tamanho da fonte
                    fontWeight: FontWeight.bold, // Negrito
                    color: Colors.white, // Cor do texto
                    shadows: [
                      // Sombra
                      Shadow(
                        // Sombra
                        blurRadius: 10.0, // Raio da sombra
                        color: Colors.black, // Cor da sombra
                        offset: Offset(5.0, 5.0), // Sombra
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento
                // Botões com ícones
                ElevatedButton.icon(
                  onPressed: () {
                    createElement();
                  }, // Função ao clicar
                  icon: const Icon(Icons.thumb_up), // Ícone de curtir
                  label: const Text('Curtir'), // Texto do botão
                  style: ElevatedButton.styleFrom(
                    // Estilo do botão
                    backgroundColor: Colors.blueAccent, // Cor de fundo
                    padding: const EdgeInsets.symmetric(
                        // Espaçamento
                        horizontal: 20,
                        vertical: 10), // Espaçamento
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10), // Espaçamento
                ElevatedButton.icon(
                  // Botão com ícone
                  onPressed: () {
                    createElement().renderObjectAttachingChild;
                  }, // Função ao clicar
                  icon: const Icon(Icons.share), // Ícone de compartilhar
                  label: const Text('Compartilhar'),
                  style: ElevatedButton.styleFrom(
                    // Estilo do botão
                    backgroundColor: Colors.greenAccent, // color
                    padding: const EdgeInsets.symmetric(
                        // padding
                        horizontal: 20,
                        vertical: 10), // padding
                    textStyle: const TextStyle(fontSize: 20), // text style
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// explicações
// 1. A classe MyApp é um widget de aplicativo que define a estrutura do aplicativo.
// 2. A classe MyHomePage é um widget de página que define o conteúdo da página.
// 3. O widget Scaffold é usado para definir a estrutura da página.
// 4. O widget Stack é usado para empilhar widgets.
// 5. O widget Container é usado para definir a imagem de fundo.
// 6. O widget Center é usado para centralizar o conteúdo.
// 7. O widget Column é usado para empilhar widgets verticalmente.
// 8. O widget Text é usado para exibir o texto.
// 9. O widget ElevatedButton.icon é usado para criar um botão com ícone.
// 10. O widget SizedBox é usado para adicionar espaçamento entre widgets.
// 11. O widget Icon é usado para exibir um ícone.
// 12. O widget TextStyle é usado para definir o estilo do texto.
// 13. O widget ElevatedButton.styleFrom é usado para definir o estilo do botão.
// 14. O widget DecorationImage é usado para definir a imagem de fundo.
// 15. O widget VisualDensity é usado para definir a densidade visual.
// 16. O widget Shadow é usado para definir a sombra do texto.
// 17. O widget NetworkImage é usado para carregar uma imagem da web.
// 18. O widget EdgeInsets é usado para definir o espaçamento.
// 19. O widget Offset é usado para definir o deslocamento da sombra.
// 20. O widget Colors é usado para definir as cores.
// 21. O widget FontWeight é usado para definir o peso da fonte.
// 22. O widget BoxFit é usado para definir o ajuste da imagem.
// 23. O widget MainAxisAlignment é usado para definir o alinhamento principal.
// 24. O widget CrossAxisAlignment é usado para definir o alinhamento cruzado.
// 25. O widget TextDirection é usado para definir a direção do texto.
// 26. O widget CrossAxisAlignment é usado para definir o alinhamento cruzado.
// 27. O widget MainAxisAlignment é usado para definir o alinhamento principal.
