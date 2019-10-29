import 'dart:convert';

import 'package:http/http.dart';

main() {
  NetworkHelper helper = new NetworkHelper();
  helper.getaData();
}

class NetworkHelper {
  List articles;
  String country;

  Future<List> getaData() async {
    Response response = await get(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=0eea7a48d41d463d8dc78c5bb0ebec84');
    Map responseData = jsonDecode(response.body);
    List articles = responseData['articles'];

    return articles;
  }
}
