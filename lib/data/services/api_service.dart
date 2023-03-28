import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final _baseurl = "https://ai-sight.onrender.com";

  Future getMe(String email) async {
    final url = Uri.parse('$_baseurl/find-user');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = await http
          .post(url,
              headers: headers,
              body: json.encode({
                'email': email,
              }))
          .then((response) {
        return response;
      });

      return response;
    } catch (e) {
      return e;
    }
  }

  Future uploadFile(File file, String email) async {
    final url = Uri.parse('$_baseurl/find-user');
    try {
      Map<String, String> headers = {
        "Content-type": "multipart/form-data",
      };

      ///MultiPart request
      var request = http.MultipartRequest(
        'POST',
        url,
      );

      request.files.add(
        http.MultipartFile(
          'file',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: email,
        ),
      );

      var res = await request.send().then((r) {
        return r;
      });
      return res;
    } catch (e) {
      return e;
    }
  }
}
