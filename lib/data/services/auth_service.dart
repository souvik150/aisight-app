import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final _baseurl = "";

  Future login(String phoneNumber, String password) async {
    final url = Uri.parse('$_baseurl/auth/login');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = await http
          .post(url,
              headers: headers,
              body: json.encode({
                'phoneNumber': phoneNumber,
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
    String fullName,
    String phonenumber,
    String email,
    String password,
  ) async {
    final url = Uri.parse('$_baseurl/auth/signup');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = http
          .post(
        url,
        headers: headers,
        body: json.encode(
          {
            'fullName': fullName,
            'phoneNumber': phonenumber,
            'email': email,
            'password': password,
            'confirm': password,
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

  Future otpVerify(String otp, String token) async {
    final url = Uri.parse('$_baseurl/users/verify');

    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": token
      };

      final response = http
          .patch(
        url,
        headers: headers,
        body: json.encode(
          {
            'verifyotp': otp,
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

  Future resetPassword(String phoneNumber, String otp, String password) async {
    final url = Uri.parse('$_baseurl/users/verify');

    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = http
          .patch(
        url,
        headers: headers,
        body: json.encode(
          {
            'verifyotp': otp,
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

  Future resendOtp(String phoneNumber) async {
    final url = Uri.parse('$_baseurl/auth/forgotpassword');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = http
          .post(
        url,
        headers: headers,
        body: json.encode(
          {
            'phoneNumber': phoneNumber,
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

  Future resendOtpVerify(String phoneNumber) async {
    final url = Uri.parse('$_baseurl/auth/resendotp');
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = http
          .post(
        url,
        headers: headers,
        body: json.encode(
          {
            'phoneNumber': phoneNumber,
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
