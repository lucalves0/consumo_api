import 'package:consumo_api/app/data/http/execeptions.dart';
import 'package:consumo_api/app/data/models/produto_model.dart';
import 'package:consumo_api/app/data/repositories/imovel_repository.dart';
import 'package:flutter/material.dart';

class ImovelStore {
  final Repository repository;

  // Variável reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ImovelStore({required this.repository});

  getImoveis() async {
    isLoading.value = true;

    try {
      final result = await repository.getImovel();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
