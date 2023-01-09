import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final Uri apiCall;
  NetworkHelper(this.apiCall);

  Future getData() async {
    http.Response response = await http.get(apiCall);
    if (response.statusCode == 200) {
      String weatherData = response.body;
      // return jsonDecode(weatherData);
      return weatherData;
    } else {
      print(response.statusCode);
    }
  }
}
