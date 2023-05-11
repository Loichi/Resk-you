import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/buttons/segmented_button.dart';
import 'package:get/get.dart';

import '../components/menus/menu_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class CallView extends StatefulWidget {
  const CallView({super.key});

  @override
  CallViewState createState() => CallViewState();
}

class CallViewState extends State<CallView> {
//utilisation d'une variable qui recupere le numero que l'on souhaite appeller
  phoneCall(value) async {
    final phone = Uri.parse(value);
    await launchUrl(phone);
  }

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'lib/assets/images/CallLogo@3x.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            const Text(
              "Contexte de l'appel :",
              style: TextStyle(
                  color: Color.fromRGBO(204, 18, 51, 1.000),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SegmentedButton(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(204, 18, 51, 1.000)),
                onPressed: () {
                  phoneCall(value);
                },
                child: const Text(
                  "Appeler",
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
              child: const Text(
                "X Annuler et revenir à l'accueil",
                style: TextStyle(color: Color.fromRGBO(204, 18, 51, 1.000)),
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      )),
    ));
  }
}
