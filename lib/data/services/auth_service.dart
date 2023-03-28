import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final _baseurl = "https://ai-sight.onrender.com";

  Future login(String email, String password) async {
    final url = Uri.parse('$_baseurl/login');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      print(email +" "+password);

      final response = await http
          .post(url,
              headers: headers,
              body: json.encode({
                'email': email,
                'password': password,
              }))
          .then((response) {
        return response;
      });

      return response;
    } catch (e) {
      return e;
    }
  }

  Future signup(
    String name,
    String email,
    String password,
    String phoneNum,
    String height,
    String weight,
  ) async {
    final url = Uri.parse('$_baseurl/signup/user');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = http
          .post(
        url,
        headers: headers,
        body: json.encode(
          {
            'name': name,
            'email': email,
            'password': password,
            'phone_num': phoneNum,
            'height': height,
            'weight': weight,
          },
        ),
      )
          .then((response) {
        return response;
      });
      return response;
    } catch (e) {
      return e;
    }
  }
}
