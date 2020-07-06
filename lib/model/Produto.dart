class Produto {
  int _codProduto;
  String _nomeProduto;
  int _valor;

  var codProduto;

  //construtor

  Produto(this._codProduto, this._valor, [this._nomeProduto]);
  Produto.withCodCliente(this._codProduto, this._valor, [this._nomeProduto]);

// gets

  String get nomeProduto => _nomeProduto;
  int get codProdut => _codProduto;
  int get valor => _valor;

//set
  set codProd(int newcodProd) => this.codProduto = newcodProd;

  set nomeProd(String newnomeProd) => this._nomeProduto = newnomeProd;
  set valo(int newvalor) => this._valor = newvalor;

////converte objeto cliente em objeto mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (codProduto != null) {
      map['codProduto'] = _codProduto;
    }

    map['codProduto'] = _codProduto;
    map['nomeProduto'] = _nomeProduto;
    map['valor'] = _valor;

    return map;
  }
  // extrair o objeto cliente para objeto mapa

  Produto.fromMapObject(Map<String, dynamic> map) {
    this._nomeProduto = map['nomeServico'] as String;
    this._codProduto = map['codProduto'] as int;
    this._valor = map['valor'] as int;
  }
}
