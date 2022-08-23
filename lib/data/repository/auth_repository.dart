import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:la_vie/constants/strings.dart';

class AuthLoginRepository {
  login(String email, String password) async {
    var response = await http.post(
      Uri.parse(apiUrl + loginApi),
      headers: {},
      body: {"email": email, "password": password},
    );
    final data = json.decode(response.body);
    if (data['message'] == 'Logged in Successfully') {
      print(data);
      return data;
    } else {
      return 'auth problem';
    }
  }
}

class AuthSignupRepository {
  signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + signupApi),
      headers: {},
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password
      },
    );
    final data = json.decode(response.body);
    if (data['message'] == 'User created successfully') {
      print(data);
      return data;
    } else {
      return 'auth problem';
    }
  }
}
