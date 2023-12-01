import 'package:consumo_api/app/data/http/http_client.dart';
import 'package:consumo_api/app/data/repositories/imovel_repository.dart';
import 'package:consumo_api/app/pages/home/stores/imovel_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImovelStore store = ImovelStore(
    repository: ImovelRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Consumo de APIs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const CircularProgressIndicator();
          }

          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum imovel na lista. ',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: const EdgeInsets.all(36),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item.logradouro,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.bairro,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
