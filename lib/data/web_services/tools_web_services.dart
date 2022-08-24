import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:la_vie/constants/strings.dart';

class ToolsWebServices {
  Future<List<dynamic>> getAllTools() async {
    var pref = await SharedPreferences.getInstance();
    var accessToken = pref.get('accessToken') as String;
    var response = await http.get(
      Uri.parse(apiUrl + toolsApi),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    final data = json.decode(response.body);

    if (data['message'] == 'Tools Fetched Successfully') {
      print(data['data']);
      return (data['data']);
    } else {
      return [];
    }
  }
}
