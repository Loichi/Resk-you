import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/forms/setPassword.dart';
import 'package:bordered_text/bordered_text.dart';

class FirstLogIn extends StatefulWidget {
  FirstLogIn({super.key});

  @override
  FirstLogInState createState() => FirstLogInState();
}

class FirstLogInState extends State<FirstLogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/background_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/logo.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      BorderedText(
                        strokeColor: Colors.black,
                        strokeWidth: 3,
                        child: const Text(
                          "Première Connexion",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SetPasswordForm(),
                ]),
          ),
        ),
      )),
    );
  }
}
