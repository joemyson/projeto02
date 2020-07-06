class Servico {
  int _codServico;
  String _nomeServico;
  int _codProduto;
  int _valor;

  var codProduto;

  //construtor

  Servico(this._codServico, this.codProduto, this._valor, [this._nomeServico]);
  Servico.withCodCliente(this._codServico, this._codProduto, this._valor,
      [this._nomeServico]);

// gets
  int get codServico => _codServico;
  String get nomeServico => _nomeServico;
  int get codProdut => _codProduto;
  int get valor => _valor;

//set
  set codServico(int newcodServ) => this.codServico = newcodServ;

  set nomeServico(String newnomeserv) => this._nomeServico = newnomeserv;
  set valo(int newvalor) => this._valor = newvalor;
  set codProdut(int newcodProduto) => codProduto = newcodProduto;

////converte objeto cliente em objeto mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (codServico != null) {
      map['codCliente'] = _codServico;
    }

    map['codServico'] = _codServico;
    map['nomeServico'] = _nomeServico;
    map['codProduto'] = _codProduto;
    map['valor'] = _valor;

    return map;
  }
  // extrair o objeto cliente para objeto mapa

  Servico.fromMapObject(Map<String, dynamic> map) {
    this._codServico = map['codServico'] as int;
    this._nomeServico = map['nomeServico'] as String;

    this._codProduto = map['codProduto'] as int;
  }
}
