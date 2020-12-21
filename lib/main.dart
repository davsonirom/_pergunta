import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionda = 0;
  var _pontuacaoTotal = 0;
  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionda++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionda = 0;
      _pontuacaoTotal = 0;
    });
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Rosa', 'pontuacao': 20},
        {'texto': 'Verde', 'pontuacao': 12},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 6},
        {'texto': 'Gato', 'pontuacao': 1},
        {'texto': 'Raposa', 'pontuacao': 2},
        {'texto': 'Zebra', 'pontuacao': 5},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionda < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionda: _perguntaSelecionda,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
