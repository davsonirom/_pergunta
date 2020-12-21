import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionda;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionda,
    @required this.responder,
  });
  bool get temPerguntaSelecionada {
    return perguntaSelecionda < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionda]['respostas']
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionda]['texto']),
        // forma declarativa do codigo no lugar de uma declaracao imperativa usando um for com exemplo
        ...respostas
            .map((resp) =>
                Resposta(resp['texto'], () => responder(resp['pontuacao'])))
            .toList(),
      ],
    );
  }
}
