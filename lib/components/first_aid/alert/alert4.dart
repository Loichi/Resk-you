import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/simple_orange_text.dart';

class AlertFour extends StatelessWidget {
  final updateState;

  const AlertFour({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.4,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: const Text("Ecouter",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        SimpleOrangeText(
            "- Bien écouter leurs conseils et actions/gestes à effectuer", 17),
        SimpleOrangeText("- Ne raccrocher QUE LORSQUE l'opérateur le dit", 17),
        SimpleOrangeText(
            "- Garder le téléphone à proximité et libre afin d'être rappelé par les secours si besoin",
            17),
        SimpleOrangeText(
            "ATTENTION -- Souvent les secours rappel avec un numéro masqué",
            17),
        SimpleOrangeText(
            "- Envoyer une personne au devant des secours pour leur facilité l'arrivée",
            17),
        DoubleBlueClickableText("Menu l'alerte", updateState, "alert1"),
      ],
    );
  }
}
