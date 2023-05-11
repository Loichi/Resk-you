import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Compression extends StatelessWidget {
  final updateState;

  const Compression({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),

        RichText(
          text: TextSpan(
            text: 'Adulte : 5 compressions de ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: "l'abdomen", style: TextStyle(color: Colors.blue))
            ],
          ),
        ),

        /// image personne agé qui s'étouffe
        Image.asset("lib/assets/images/first_aid/chokingImage2.png", width: 40),
        RichText(
          text: TextSpan(
            text: 'Nourisson : 5 compressions',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: "thoraciques", style: TextStyle(color: Colors.red))
            ],
          ),
        ),

        /// image bébé qui s'étouffe
        Image.asset("lib/assets/images/first_aid/chokingImage3.png", width: 80),
        const Text("Obèses / Femme enceinte :"),
        RichText(
          text: TextSpan(
            text: '5 compressions',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: "thoraciques", style: TextStyle(color: Colors.red))
            ],
          ),
        ),
        Image.asset("lib/assets/images/first_aid/chocking.jpg", width: 80),
        TopText("Efficace?"),
        SingleClickableText("Oui", updateState, "look_on"),
        SingleClickableText("Non", updateState, "renew_cycle"),

        const SingleBlueClickableText()
      ],
    );
  }
}
