class ProdutoModel {
  final String logradouroId;
  final String quarteiraoId;
  final String localidade;
  final String bairroId;
  final String tipoDeImovelId;

  ProdutoModel({
    required this.logradouroId,
    required this.quarteiraoId,
    required this.localidade,
    required this.bairroId,
    required this.tipoDeImovelId,
  });

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      logradouroId: map['logradouroId'],
      quarteiraoId: map['quarteiraoId'],
      localidade: map['localidade'],
      bairroId: map['bairroId'],
      tipoDeImovelId: map['tipoDeImovelId'],
    );
  }
}
