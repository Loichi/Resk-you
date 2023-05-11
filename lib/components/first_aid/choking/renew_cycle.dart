import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class RenewCycle extends StatelessWidget {
  final updateState;

  const RenewCycle({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Renouveler le cycle de:"),
                Text("-5 claques"),
                Text("Puis"),
                Text("-5 compressions"),
                Text(
                    "-Jusqu'à expulsion du corps encombrant et que la personne respire de nouveau"),
              ],
            )),
        const SingleBlueClickableText()
      ],
    );
  }
}
