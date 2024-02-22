import 'package:flutter/material.dart';
import 'package:pmfilmes/dominio/genero.dart';
import 'package:pmfilmes/vm/genero_view_model.dart';
import 'package:provider/provider.dart';

class GeneroItemView extends StatelessWidget {
  final Genero genero;

  const GeneroItemView({
    super.key,
    required this.genero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(genero.nome),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }

  void clic(BuildContext context) {
    //Recupera um GeneroViewModel do provider com o estado
    //Compartilhado na aplicacao
    final vm = Provider.of<GeneroViewModel>(context);
    vm.selecionaGenero(genero);

    //fecha a tela inicial
    Navigator.pop(context);
  }
}






















//Widget é qualquer componente que o usuario possa interagir 