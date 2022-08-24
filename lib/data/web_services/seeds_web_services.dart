import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:la_vie/constants/strings.dart';

class SeedsWebServices {
  Future<List<dynamic>> getAllSeeds() async {
    var pref = await SharedPreferences.getInstance();
    var accessToken = pref.get('accessToken') as String;
    var response = await http.get(
      Uri.parse(apiUrl + seedsApi),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    final data = json.decode(response.body);

    if (data['message'] == 'Seed Fetched Successfully') {
      print('yes');
      print(data['data']);
      return (data['data']);
    } else {
      print('no');
      return [];
    }
  }
}

// class SeedsWebServices {
//   late Dio dio;

//   SeedsWebServices() {
//     BaseOptions options = BaseOptions(
//         baseUrl: apiUrl,
//         receiveDataWhenStatusError: true,
//         connectTimeout: 20 * 1000,
//         receiveTimeout: 20 * 1000,
//         headers: {'Authorization': 'Bearer $accessToken'});
//     dio = Dio(options);
//   }

//   Future<List<dynamic>> getAllSeeds() async {
//     var pref = await SharedPreferences.getInstance();
//     var accessToken = pref.get('accessToken') as String;
//     try {
//       Response response = await dio.get('seeds');
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//       return [];
//     }
//   }
// }
