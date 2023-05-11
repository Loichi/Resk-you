import 'package:flutter/material.dart';

class NoDanger extends StatelessWidget {
  const NoDanger({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        child: Text(
      "Si pas de danger retour menu geste de 1er secours",
      style: TextStyle(
        fontSize: 20,
        color: Colors.red[600],
      ),
      textAlign: TextAlign.center,
    ));
  }
}
