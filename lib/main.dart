import 'package:flutter/material.dart';

void main() {
  runApp(const TradutorApp());
}

class TradutorApp extends StatelessWidget {
  const TradutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradutor de Palavras',
      home: const TelaTradutor(),
    );
  }
}

class TelaTradutor extends StatefulWidget {
  const TelaTradutor({super.key});

  @override
  State<TelaTradutor> createState() => _TelaTradutorState();
}

class _TelaTradutorState extends State<TelaTradutor> {
  final List<Map<String, String>> palavras = [
    {'pt': 'Casa', 'en': 'House', 'es': 'Casa'},
    {'pt': 'Cachorro', 'en': 'Dog', 'es': 'Perro'},
    {'pt': 'Livro', 'en': 'Book', 'es': 'Libro'},
    {'pt': 'Água', 'en': 'Water', 'es': 'Agua'},
    {'pt': 'Sol', 'en': 'Sun', 'es': 'Sol'},
    {'pt': 'Lua', 'en': 'Moon', 'es': 'Luna'},
    {'pt': 'Amigo', 'en': 'Friend', 'es': 'Amigo'},
    {'pt': 'Escola', 'en': 'School', 'es': 'Escuela'},
    {'pt': 'Cidade', 'en': 'City', 'es': 'Ciudad'},
    {'pt': 'Comida', 'en': 'Food', 'es': 'Comida'},
  ];

  int indiceAtual = 0;
  bool mostrarTraducao = false;

  void proximaPalavra() {
    setState(() {
      indiceAtual = (indiceAtual + 1) % palavras.length;
      mostrarTraducao = false;
    });
  }

  void palavraAnterior() {
    setState(() {
      indiceAtual = (indiceAtual - 1 + palavras.length) % palavras.length;
      mostrarTraducao = false;
    });
  }

  void alternarTraducao() {
    setState(() {
      mostrarTraducao = !mostrarTraducao;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palavra = palavras[indiceAtual];

    return Scaffold(
      appBar: AppBar(title: const Text('Tradutor de Palavras')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(palavra['pt']!, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            if (mostrarTraducao) ...[
              Text(palavra['en']!, style: const TextStyle(fontSize: 25)),
              Text(palavra['es']!, style: const TextStyle(fontSize: 25)),
            ],
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: palavraAnterior,
                  child: const Text('Anterior'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: alternarTraducao,
                  child: const Text('Mostrar tradução'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: proximaPalavra,
                  child: const Text('Próxima'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
