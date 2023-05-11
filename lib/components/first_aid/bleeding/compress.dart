import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Compress extends StatelessWidget {
  final updateState;

  const Compress({super.key, this.updateState});
  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.9,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Je me protège les mains",
                      style: textStyle,
                    ),
                    Text(
                      "J'appui sur l'endroit qui saigne",
                      style: textStyle,
                    ),
                    Text(
                      "J'allonge la victime",
                      style: textStyle,
                    ),
                  ],
                )),
          ),
        ),
        Image.asset(
            width: 150, "lib/assets/images/first_aid/saignementUno.jpg"),
        TopText("Je dois me libérer ?"),
        SingleClickableText("OUI", updateState, "pad"),
        SingleClickableText("NON", updateState, "action_bleeding"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
