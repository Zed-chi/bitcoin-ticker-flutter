import "package:http/http.dart";
import "dart:convert";

const baseUrl = "https://apiv2.bitcoinaverage.com";
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  dynamic getCoinData( cur )async {
    String url = "$baseUrl/indices/global/ticker/BTC$cur";
    print(url);
    var res = await get(url);
    if (res.statusCode == 200){
      return jsonDecode(res.body);
    } else{
      print("Error");
      return null;
    }
  }
}
