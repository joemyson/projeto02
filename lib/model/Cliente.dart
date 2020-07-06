class Cliente {
  int _codCliente;
  String _nome;
  String _email;
  int _telefone;

  //construtor

  Cliente(this._telefone, this._email, [this._nome]);
  Cliente.withCodCliente(this._codCliente, this._email, this._telefone,
      [this._nome]);

// gets
  int get codCliente => _codCliente;
  String get nome => _nome;
  String get email => _email;
  int get telefone => _telefone;

//set
  set codCliente(int newcodCli) => this.codCliente = newcodCli;

  set nome(String newnomecli) => this._nome = newnomecli;
  set email(String newemailcli) => this._email = newemailcli;
  set telefone(int newtelefonecli) => this._telefone = newtelefonecli;

////converte objeto cliente em objeto mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (codCliente != null) {
      map['codCliente'] = _codCliente;
    }

    map['codCliente'] = _codCliente;
    map['nome'] = _nome;
    map['email'] = _email;
    map['telefone'] = _telefone;

    return map;
  }
  // extrair o objeto cliente para objeto mapa

  Cliente.fromMapObject(Map<String, dynamic> map) {
    this._codCliente = map['codCliente'] as int;
    this._nome = map['nome'] as String;
    this._email = map['email'] as String;
    this._telefone = map['telefone'] as int;
  }
}
