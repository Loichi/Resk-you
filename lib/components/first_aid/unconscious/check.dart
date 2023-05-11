import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Check extends StatelessWidget {
  final updateState;

  const Check({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TopText("Action à réaliser "),
      Container(
          decoration: BoxDecoration(color: Colors.green[100]),
          child: Column(
            children: [
              Text(
                "Je crie FORT à l'aide ! ",
                style: TextStyle(color: Colors.red[600]),
              ),
              const Text("Pour faire venir une autre personne en renfort"),
              const Text("Je libère les voies aériennes :"),
              const Text("Desserrer la ceinture"),
              const Text("Desserrer le col"),
              const Text("Baculer prudemment la tête en arrière"),
              const Text("Je regarde si la poitrine se lève"),
              const Text("Je sens si l'ait sort de sa bouche"),
              const Text("J'écoute si un bruit sort de sa bouche"),
              Text(
                "Pendant minimum 10 secondes ",
                style: TextStyle(color: Colors.red[600]),
              ),
            ],
          )),
      TopText("Elle respire ? "),
      SingleClickableText("OUI", updateState, "breathing"),
      SingleClickableText("NON", updateState, "not_breathing"),
      const SingleBlueClickableText()
    ]);
  }
}
