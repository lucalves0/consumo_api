class ProdutoModel {
  final String logradouro;
  final String quarteirao;
  final String localidade;
  final String bairro;
  final String tipoDeImovel;

  ProdutoModel({
    required this.logradouro,
    required this.quarteirao,
    required this.localidade,
    required this.bairro,
    required this.tipoDeImovel,
  });

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      logradouro: map['logradouro'],
      quarteirao: map['quarteirao'],
      localidade: map['localidade'],
      bairro: map['bairro'],
      tipoDeImovel: map['tipoDeImovel'],
    );
  }
}
