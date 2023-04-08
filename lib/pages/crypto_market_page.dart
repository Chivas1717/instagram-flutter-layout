import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_bloc.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_event.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_state.dart';
import 'package:flutter_instagram_layout/models/crypto_model.dart';
import 'package:flutter_instagram_layout/repo/repositories.dart';

class CryptoMarket extends StatelessWidget {
  const CryptoMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CryptoBloc(
              CryptoRepository(),
            )..add(
                LoadCryptoEvent(),
              ),
        child: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) {
            void refreshPrices() {
              context.read<CryptoBloc>().add(LoadCryptoEvent());
            }

            if (state is CryptoLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CryptoErrorState) {
              return const Center(child: Text("Error"));
            }
            if (state is CryptoLoadedState) {
              List<CryptoData> coins = state.coins;
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.close),
                  actions: [
                    IconButton(
                      onPressed: refreshPrices,
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: coins.length,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          children: [
                            Text(
                              state.coins[index].assetId!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '${state.coins[index].priceUsd!} \$',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }
            return Container();
          },
        ));
  }
}
