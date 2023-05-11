import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Child extends StatelessWidget {
  final updateState;

  const Child({super.key, this.updateState});

  final TextStyle textStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TopText("Action à réaliser "),
      Flexible(
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
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
                        "Le sauveteur appui avec 1 main",
                        style: textStyle,
                      ),
                      Text(
                        "Il alterne",
                        style: textStyle,
                      ),
                      Text(
                        "30 compressions sur la poitrine",
                        style: textStyle,
                      ),
                      Text(
                        "2 insufflation (si possible)",
                        style: textStyle,
                      ),
                      Text(
                        "au rythme de 100 a 120 compressions/minute",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                      Text(
                        "La cage thoracique doit d'enfoncer de 4-5 cm",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      )
                    ])),
          ),
        ),
      ),
      Image.asset(
        'lib/assets/images/first_aid/enfant.png',
        width: 200,
      ),
      DoubleBlueClickableText("Ne respire pas", updateState, "not_breathing"),
    ]);
  }
}
