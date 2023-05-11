import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class ForeignBody extends StatelessWidget {
  final updateState;

  const ForeignBody({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Y-a-t-il un corps étranger ? "),
        SingleClickableText("OUI", updateState, "garrot"),
        SingleClickableText("NON", updateState, "compress"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
