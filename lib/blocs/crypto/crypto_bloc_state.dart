import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/models/crypto_model.dart';

@immutable
abstract class CryptoState extends Equatable {}

class CryptoLoadingState extends CryptoState {
  @override
  List<Object?> get props => [];
}

class CryptoLoadedState extends CryptoState {
  final List<CryptoData> coins;
  CryptoLoadedState(this.coins);
  @override
  List<Object?> get props => [coins];
}

class CryptoErrorState extends CryptoState {
  final String error;
  CryptoErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
