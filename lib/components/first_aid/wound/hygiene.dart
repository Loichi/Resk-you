import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Hygiene extends StatelessWidget {
  final updateState;

  const Hygiene({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser ? "),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Se laver les mains"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Rincer la plaie puis la désinfecter"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Protéger la plaie"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Demander si les vaccins sont à jour"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Surveiller (température-rougeur-déformation)"),
                Text("Couvrir"),
                Text("Rassurer"),
              ],
            )),
        DoubleBlueClickableText("Plaie", updateState, "wound_body"),
      ],
    );
  }
}
