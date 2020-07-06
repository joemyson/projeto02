import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:novoprojeto/model/Cliente.dart';

class HelperCliente {
  static HelperCliente _helperCliente;
  static Database _database;

  String tabelaCliente = 'tabela_Cliente';
  String colCodCliente = 'codCliente';
  String colNome = 'nome';
  String colTelefone = 'telefone';
  String colEmail = 'email';

  HelperCliente._createInstance();

  factory HelperCliente() {
    if (_helperCliente == null) {
      _helperCliente = HelperCliente._createInstance();
    }

    return _helperCliente;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cliente.db';

    var clienteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return clienteDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tabelaCliente($colCodCliente INTEGER PRIMARY KEY,"
        "$colNome TEXT,"
        "$colEmail TEXT,"
        "$colTelefone TEXT)");
  }

  Future<List<Map<String, dynamic>>> getClienteMapList() async {
    Database db = await this.database;
    //var result = await db.rawQuery('SELECT* FROM $tabelaCliente order by $colCodCliente ASC');
    var result = await db.query(tabelaCliente, orderBy: '$colCodCliente ASC');
    return result;
  }

  Future<int> insertCliente(Cliente cliente) async {
    Database db = await this.database;
    var result = await db.insert(tabelaCliente, cliente.toMap());
    return result;
  }

  Future<int> updateCliente(Cliente cliente) async {
    var db = await this.database;
    var result = await db.update(tabelaCliente, cliente.toMap(),
        where: '$colCodCliente=?', whereArgs: [cliente.codCliente]);
    return result;
  }

  Future<int> deleteCliente(int codCliente) async {
    var db = await this.database;
    int result = await db.rawDelete(
        'DELETE FROM $tabelaCliente WHERE $colCodCliente = $codCliente');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT(*)from $tabelaCliente');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Cliente>> getliscadastro() async {
    var mapaLista = await getClienteMapList();
    int count = mapaLista.length;
    List<Cliente> lista = List<Cliente>();

    for (int i = 0; i < count; i++) {
      lista.add(Cliente.fromMapObject(mapaLista[i]));
    }
    return lista;
  }
}
