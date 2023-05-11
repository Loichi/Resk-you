import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:resk_you_mobile/services/interfaces/company/user.dart';
import '../../services/interfaces/authentification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SetPasswordForm extends StatefulWidget {
  const SetPasswordForm({super.key});

  @override
  SetPasswordFormState createState() => SetPasswordFormState();
}

class SetPasswordFormState extends State<SetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthentificationInterface auth = AuthentificationInterface();
  UserClientInterface userClient = UserClientInterface();
  UserCompanyInterface userCompanyInterface = UserCompanyInterface();

  final storage = const FlutterSecureStorage();

//permet de changer l'icone de visibilité du mdp
  bool visibility = true;
  bool visibilityBis = true;

  /// form + message conditionnel
  String password = "";
  String email = "";
  String confirmPassword = "";
  String passwordCheck = "";
  String wrong = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                email = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Votre adresse mail",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onFieldSubmitted: (value) {
                password = value;
              },
              obscureText: visibility,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "nouveau mot de passe",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () {
                      visibility = !visibility;
                    },
                  ),
                  child: Icon(
                      !visibility ? Icons.visibility : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onFieldSubmitted: (valueBis) {
                confirmPassword = valueBis;
              },
              obscureText: visibilityBis,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "confirmer le mot de passe",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      visibilityBis = !visibilityBis;
                    });
                  },
                  child: Icon(
                      !visibilityBis ? Icons.visibility : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(wrong, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(204, 18, 51, 1.000),
                  minimumSize: const Size(132, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () async {
                if (password == confirmPassword) {
                  await userCompanyInterface.changePassword(
                      password, confirmPassword);
                } else {
                  wrong = "mot de passe incorrect";
                }
                setState(() {});
              },
              child: const Text(
                "VALIDER",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ));
}
