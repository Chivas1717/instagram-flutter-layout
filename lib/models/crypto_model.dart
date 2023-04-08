class CryptoData {
  String? assetId;
  double? priceUsd;

  CryptoData({this.assetId, this.priceUsd});

  CryptoData.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    priceUsd = json['price_usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['asset_id'] = this.assetId;
    data['price_usd'] = this.priceUsd;
    return data;
  }
}
