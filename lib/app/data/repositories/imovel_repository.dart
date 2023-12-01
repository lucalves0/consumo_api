import 'dart:convert';
import 'package:consumo_api/app/data/http/execeptions.dart';
import 'package:consumo_api/app/data/http/http_client.dart';
import 'package:consumo_api/app/data/models/produto_model.dart';

abstract class Repository {
  Future<List<ProdutoModel>> getImovel();
}

class ImovelRepository implements Repository {
  final IHttpClient client;

  ImovelRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getImovel() async {
    final response = await client.get(
      url: '',
    );

    if (response.statusCode == 200) {
      final List<ProdutoModel> imoveis = [];

      final body = jsonDecode(response.body);

      body['imovel'].map((item) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        imoveis.add(produto);
      }).toList();

      return imoveis;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida.');
    } else {
      throw Exception('Não foi possível carrregar os imovéis');
    }
  }
}
