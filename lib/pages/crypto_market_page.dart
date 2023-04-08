import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_bloc.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_event.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_state.dart';
import 'package:flutter_instagram_layout/models/crypto_model.dart';
import 'package:flutter_instagram_layout/repo/repositories.dart';

class CryptoMarket extends StatelessWidget {
  const CryptoMarket({super.key});

  static Map<String, String> coinAvatars = {
    'BTC': 'Bitcoin.png',
    'ETH': 'Ethereum.png',
    'DOGE': 'Doge.png',
  };

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
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is CryptoErrorState) {
              return const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            }
            if (state is CryptoLoadedState) {
              List<CryptoData> coins = state.coins;
              return Scaffold(
                appBar: AppBar(
                  leading: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => Navigator.of(context).pop(),
                      child: Ink(
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  title: const Text('Crypto Market'),
                  actions: [
                    IconButton(
                      onPressed: refreshPrices,
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: coins.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        decoration: const BoxDecoration(),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 34,
                              child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  'assets/imgs/crypto/${coinAvatars[coins[index].assetId!]}',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              coins[index].assetId!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              '${coins[index].priceUsd!} \$',
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
