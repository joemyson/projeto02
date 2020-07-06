import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novoprojeto/layout/cadastra.dart';
import 'package:novoprojeto/model/Cliente.dart';
import 'dart:async';
import 'package:novoprojeto/utils/helpCliente.dart';
import 'package:intl/intl.dart';

class Cadastra extends StatefulWidget {
  int prioridade;

  String codCliente;

  String telefone;
  HelperCliente helperCliente = HelperCliente();

  @override
  _CadastraState createState() => _CadastraState();
}

class _CadastraState extends State<Cadastra> {
  TextEditingController controlenome = TextEditingController();
  TextEditingController controletelefone = TextEditingController();
  TextEditingController controleEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Cadastra Cliente',
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 30,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'codigo',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                ),
              ],
            ),
            TextFormField(
              controller: controlenome,
              onChanged: (value) {
                debugPrint('nome incluido');
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Container(
              width: 20.0,
            ),
            TextFormField(
              controller: controletelefone,
              onChanged: (value) {
                debugPrint('telefone incluido');
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'telefone',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Container(
              width: 20.0,
            ),
            TextFormField(
              controller: controleEmail,
              onChanged: (value) {
                debugPrint('email incluido');
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'cancelar',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('salvo!');
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Salva',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('salvo!');
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
