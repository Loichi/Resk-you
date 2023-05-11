import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class CanShock extends StatelessWidget {
  final updateState;

  const CanShock({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: [
                const Text("Allumer l'appareil"),
                Text("Suivre les consignes",
                    style: TextStyle(color: Colors.red[700])),
              ],
            )),
        TopText("Choc autorisé?"),
        SingleClickableText("OUI", updateState, "shocking"),
        SingleClickableText("NON", updateState, "heart_massage"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
