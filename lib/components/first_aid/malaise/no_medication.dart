import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';

class NoMedication extends StatelessWidget {
  final updateState;

  const NoMedication({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("En attendant les secours"),
                Text("- Surveiller"),
                Text("- Couvrir"),
                Text("- Rassurer"),
              ],
            )),
        const SingleBlueClickableText()
      ],
    );
  }
}
