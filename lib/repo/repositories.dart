import 'package:dio/dio.dart';
import 'package:flutter_instagram_layout/models/crypto_model.dart';
// import 'package:http/http.dart' as http;

class CryptoRepository {
  // String apiKey = '0F8B9210-A0D0-43BA-961D-70787B37E62D';
  String apiKey2 = 'EA8CF1E7-285A-41FF-8EB5-B7AC338FF182';

  Future<List<CryptoData>> getCoins() async {
    var dio = Dio();
    String url =
        'https://rest.coinapi.io/v1/assets?filter_asset_id=BTC;ETH;DOGE';
    Response response = await dio.get(
      url,
      options: Options(
        headers: {'X-CoinAPI-Key': apiKey2},
      ),
    );

    // final response = await http.get(
    //   Uri.parse(url),
    //   headers: {'X-CoinAPI-Key': apiKey2},
    // );

    if (response.statusCode == 200) {
      final List result = response.data; // response.body;
      return result.map((e) => CryptoData.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
