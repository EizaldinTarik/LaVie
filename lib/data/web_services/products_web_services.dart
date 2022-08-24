import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:la_vie/constants/strings.dart';

class ProductsWebServices {
  Future<List<dynamic>> getAllProducts() async {
    var pref = await SharedPreferences.getInstance();
    var accessToken = pref.get('accessToken') as String;
    var response = await http.get(
      Uri.parse(apiUrl + productsApi),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    final data = json.decode(response.body);

    if (data['message'] == 'Product Fetched Successfully') {
      print('yes');
      print(data['data']);
      return (data['data']);
    } else {
      print('no');
      return [];
    }
  }
}
