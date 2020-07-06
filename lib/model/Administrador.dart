class Administrador {
  int _codServico;
  int _codCliente;
  int _codAdmin;
  int _codProduto;
  String _nomeAdmin;
  int _data;

  var codProduto;

  //construtor

  Administrador(this._codServico, this.codProduto, this._data, this._codAdmin,
      [this._nomeAdmin]);
  Administrador.withCodCliente(
      this._codServico, this._codProduto, this._data, this._codAdmin,
      [this._nomeAdmin]);

// gets
  int get codServico => _codServico;
  int get codProdut => _codProduto;
  int get codCliente => _codCliente;
  int get codAdmin => _codAdmin;
  int get data => _data;
  String get nomeAdmin => _nomeAdmin;

//set
  set codAdmin(int newcodAdmin) => this.codAdmin = newcodAdmin;
  set codProdut(int newcodProduto) => codProduto = newcodProduto;
  set codServico(int newcodServico) => codServico = newcodServico;
  set codCliente(int newcodCliente) => codCliente = newcodCliente;
  set nomeAdmin(String newnomeadmin) => this._nomeAdmin = newnomeadmin;
  set data(int newdata) => this._data = newdata;

////converte objeto cliente em objeto mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (codAdmin != null) {
      map['codCliente'] = _codAdmin;
    }

    map['codServico'] = _codServico;
    map['codCliente'] = _codCliente;
    map['codProduto'] = _codProduto;
    map['data'] = _data;
    map['nomeAdmin'] = _nomeAdmin;

    return map;
  }
  // extrair o objeto cliente para objeto mapa

  Administrador.fromMapObject(Map<String, dynamic> map) {
    this._codServico = map['codServico'] as int;
    this._nomeAdmin = map['nomeServico'] as String;
    this.codCliente = map['codCliente'] as int;
    this._codProduto = map['codProduto'] as int;
    this.codAdmin = map['codAdmin'] as int;
    this._data = map['data'] as int;
  }
}
