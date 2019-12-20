import "package:http/http.dart";
import "dart:convert";

const baseUrl = "https://apiv2.bitcoinaverage.com";
class Network{
  dynamic getJsonData() {
    return jsonEncode({"USD":123});
  }
}