import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_event.dart';
import 'package:flutter_instagram_layout/blocs/crypto/crypto_bloc_state.dart';

import '../../repo/repositories.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;

  CryptoBloc(this._cryptoRepository) : super(CryptoLoadingState()) {
    on<LoadCryptoEvent>(_loadCryptoEvent);
  }

  void _loadCryptoEvent(event, emit) async {
    emit(CryptoLoadingState());
    try {
      final result = await _cryptoRepository.getCoins();
      // var result;
      // _cryptoRepository.getCoins().then(
      //   (value) {
      //     result = value;
      //   },
      // );
      emit(CryptoLoadedState(result));
    } catch (e) {
      emit(CryptoErrorState(e.toString()));
    }
  }

  // old verison
  //
  // CryptoBloc(this._cryptoRepository) : super(CryptoLoadingState()) {
  //   on<LoadCryptoEvent>((event, emit) async {
  //     emit(CryptoLoadingState());
  //     try {
  //       final result = await _cryptoRepository.getCoins();
  //       emit(CryptoLoadedState(result));
  //     } catch (e) {
  //       emit(CryptoErrorState(e.toString()));
  //     }
  //   });
  // }
}
