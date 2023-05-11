import 'package:flutter/material.dart';
//Import de l'interface
import '../../services/interfaces/authentification.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthentificationInterface auth = AuthentificationInterface();

  final storage = const FlutterSecureStorage();

//permet de changer l'icone de visibilité du mdp
  bool visibility = true;

//input du form

  String email = "";
  String password = "";

//Methode qui permet de valider la connexion et retourne un token

  logIn() async {
    final response = await auth.logIn("dimitri@hotmail.fr", "dimitri");

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final responseToken = responseJson['token'];

      await storage.write(key: 'token', value: responseToken);
      String? token = await storage.read(key: 'token');

      if (token != null) {
        //permet de recuperer un id depuis un token
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        await storage.write(key: 'id', value: decodedToken['id']);
      }
    } else {
      throw Exception('Failed to login');
    }
    Get.toNamed('/profil');
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 300,
      child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              onChanged: (value) => setState(() => email = value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                labelText: "Adresse E-mail",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              onChanged: (value) => password = value,
              obscureText: visibility,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                suffixIcon: InkWell(
                  onTap: () => setState(() {
                    visibility = !visibility;
                  }),
                  child: Icon(
                      !visibility ? Icons.visibility : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(204, 18, 51, 1.000),
                  minimumSize: const Size(132, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                logIn();
              },
              child: const Text(
                "Se Connecter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ])));
}
