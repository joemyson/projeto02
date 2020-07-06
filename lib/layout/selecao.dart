import 'package:flutter/material.dart';
import 'package:novoprojeto/layout/agendar.dart';
import 'package:novoprojeto/layout/cadastra.dart';
import 'package:novoprojeto/layout/listaCadastro.dart';
import 'package:novoprojeto/layout/listaProduto.dart';
import 'package:novoprojeto/layout/listaVenda.dart';

import 'package:novoprojeto/layout/vendas.dart';
import 'package:novoprojeto/layout/cadastraProd.dart';

import 'listaAgenda.dart';

class Selecao extends StatefulWidget {
  @override
  _SelecaoState createState() => _SelecaoState();
}

class _SelecaoState extends State<Selecao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('selecione a opção '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              color: Colors.greenAccent,
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'cadastra cliente',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaCadastro()),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              color: Colors.greenAccent,
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Agendar',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListaAgenda()));
                },
              ),
            ),
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              color: Colors.greenAccent,
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Venda',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListaVenda()));
                },
              ),
            ),
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              color: Colors.greenAccent,
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'cadastra produto',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaProduto()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
