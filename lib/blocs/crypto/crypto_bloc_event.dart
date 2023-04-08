import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CryptoEvent extends Equatable {
  const CryptoEvent();
}

class LoadCryptoEvent extends CryptoEvent {
  @override
  List<Object?> get props => [];
}
