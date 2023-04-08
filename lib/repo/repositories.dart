import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_instagram_layout/models/crypto_model.dart';

class CryptoRepository {
  String apiKey = '0F8B9210-A0D0-43BA-961D-70787B37E62D';

  Future<List<CryptoData>> getCoins() async {
    var dio = Dio();
    String url =
        'https://rest.coinapi.io/v1/assets?filter_asset_id=BTC;ETH;DOGE';
    Response response = await dio.get(
      url,
      options: Options(
        headers: {'X-CoinAPI-Key': '0F8B9210-A0D0-43BA-961D-70787B37E62D'},
      ),
    );

    if (response.statusCode == 200) {
      final List result = response.data;
      final temp = result.map((e) => CryptoData.fromJson(e)).toList();
      return temp;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
