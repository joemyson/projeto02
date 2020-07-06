import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:novoprojeto/model/Servico.dart';

class HelperServico {
  static HelperServico _helperServico;
  static Database _dataServico;

  String tabaelaServico = 'tabela_servico';
  String colCodServico = 'codServico';
  String colNomeServico = 'nomeServico';
  String colCodProduto = 'codProduto';
  String colValor = ' valor';

  HelperServico._createInstance();

  factory HelperServico() {
    if (_helperServico == null) {
      _helperServico = HelperServico._createInstance();
    }
    return _helperServico;
  }
  Future<Database> get dataServico async {
    if (_dataServico == null) {
      _dataServico = await iniciabanco();
    }
    return dataServico;
  }

  Future<Database> iniciabanco() async {
    Directory diretorioServico = await getApplicationDocumentsDirectory();
    String pasta = diretorioServico.path + 'servicodb';

    var servicoDatabase =
        await openDatabase(pasta, version: 1, onCreate: _criarDB);
    return servicoDatabase;
  }

  void _criarDB(Database db, int novaVersao) async {
    await db.execute(
        "CRIAR TABELA $tabaelaServico($colCodServico INTEGER PRIMARY KEY,"
        "$colNomeServico TEXT,"
        "$colNomeServico TEXT,"
        "$colValor TEXT");
  }

  Future<List<Map<String, dynamic>>> getServicoMapList() async {
    Database db = await this.dataServico;

    var resultServ =
        await db.query(tabaelaServico, orderBy: "$colCodServico ASC");
    return resultServ;
  }

  Future<int> inserirServico(Servico servico) async {
    Database db = await this.dataServico;
    var resulServico = await db.insert(tabaelaServico, servico.toMap());
    return resulServico;
  }

  Future<int> atualizarServico(Servico servico) async {
    var db = await this.dataServico;
    var resultServico = await db.update(tabaelaServico, servico.toMap(),
        where: '$colCodServico=?', whereArgs: [servico.codServico]);
    return resultServico;
  }

  Future<int> apagarServico(int codServico) async {
    var db = await this.dataServico;
    int resultServico = await db.rawDelete(
        'DELETE FROM $tabaelaServico WHERE $colCodServico = codServico');
    return resultServico;
  }

  Future<int> getcount() async {
    Database db = await this.dataServico;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*)FROM $tabaelaServico');
    int resultServico = Sqflite.firstIntValue(x);
    return resultServico;
  }

  Future<List<Servico>> getListaProduto() async {
    var mapaServico = await getServicoMapList();
    int count = mapaServico.length;
    List<Servico> listaServico = List<Servico>();
    for (int i = 0; i < count; i++) {
      listaServico.add(Servico.fromMapObject(mapaServico[i]));
    }
    return listaServico;
  }
}
