import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthentificationInterface {
  String url = 'https://test.api.societe.helpp-life.fr/';

/**
 * Methode qui permet de connecter un utilisateur
 * elle a besoin de deux parametres
 * email et password
 */
  Future<http.Response> logIn(String email, String password) {
    Map<String, String> body = {'email': email, 'password': password};
    String jsonBody = json.encode(body);
    return http.post(
      Uri.parse('${url}login/backend'),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );
  }
}
