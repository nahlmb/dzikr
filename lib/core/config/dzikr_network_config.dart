import 'dart:convert';

import 'package:http/http.dart' as http;

class DzikrNetworkConfig {
  DzikrNetworkConfig({required this.baseUrl});
  final String baseUrl;

  Future doGet(String endpoint, {Map<String, String>? headers}) async {
    var response =
        await http.get(Uri.parse(baseUrl + endpoint), headers: headers);
    return jsonDecode(response.body);
  }
}
