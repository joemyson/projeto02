import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novoprojeto/layout/cadastra.dart';
import 'package:novoprojeto/model/Cliente.dart';
import 'dart:async';
import 'package:novoprojeto/utils/helpCliente.dart';
import 'package:sqflite/sqflite.dart';

class ListaCadastro extends StatefulWidget {
  @override
  _ListaCadastroState createState() => _ListaCadastroState();
}

class _ListaCadastroState extends State<ListaCadastro> {
  HelperCliente helperCliente = HelperCliente();
  List<Cadastra> listaCadastro;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (ListaCadastro == null) {
      listaCadastro = List<Cadastra>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('lista cliente'),
      ),
      body: getListaCadastroView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('click');

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cadastra()));
        },
        tooltip: 'add note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getListaCadastroView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getPrioridadeCor(this.listaCadastro[position].prioridade),
              child:
                  getPrioridadeIcone(this.listaCadastro[position].prioridade),
            ),
            title: Text(
              this.listaCadastro[position].codCliente,
            ),
            subtitle: Text(this.listaCadastro[position].telefone),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {},
            ),
            onTap: () {
              debugPrint('Listile Tapped');
            },
          ),
        );
      },
    );
  }

  Color getPrioridadeCor(int prioridade) {
    switch (prioridade) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  Icon getPrioridadeIcone(int prioridade) {
    switch (prioridade) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void delete(BuildContext context, Cliente cliente) async {
    int result = await helperCliente.deleteCliente(cliente.codCliente);
    if (result != 0) {
      mostraAviso(context, 'apagado com sucesso');
      atualizarLista();
    }
  }

  void mostraAviso(BuildContext context, String mensagem) {
    final snackbar = SnackBar(
      content: Text(mensagem),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void _snowShowBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text('deletado'),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void atualizarLista() {
    final Future<Database> dbFuture = helperCliente.initializeDatabase();

    Future<List<Cliente>> listaFutura = helperCliente.getliscadastro();

    setState(() {
      this.listaCadastro = listaCadastro;
      this.count = listaCadastro.length;
    });
  }
}
