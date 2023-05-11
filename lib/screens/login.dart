import 'package:flutter/material.dart';
//import launchurl
import 'package:url_launcher/url_launcher.dart';
//Import Form
import '../components/forms/login.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  LogInViewState createState() => LogInViewState();
}

class LogInViewState extends State<LogInView> {
  final Uri _url = Uri.parse('https://resk-you.fr/mon-compte/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/assets/images/nouveau_logo_2.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                const Text(
                  "Connexion",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const LoginForm(),
                const Text(
                  "Pas de compte ? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      launchUrl(_url);
                    },
                    child: const Text(
                      'Souscrire aux services Resk-You ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(103, 80, 164, 1.000),
                      ),
                    ))
              ]),
        ),
      )),
    );
  }
}
