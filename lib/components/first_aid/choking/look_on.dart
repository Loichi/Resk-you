import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class LookOn extends StatelessWidget {
  final updateState;

  const LookOn({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),

        /// remplacer les widget Text par nos components "DoubleGreenText" une fois la route ajoutée.
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 250,
                  child: Text(
                      "-Mettre la personne dans la position la plus confortable pour elle"),
                ),
                Text("-Si besoin demander conseil au Samu(15)"),
                Text("-Surveiller la personne"),
              ],
            )),

        DoubleBlueClickableText("Menu étouffement", updateState, "can_talk")
      ],
    );
  }
}
