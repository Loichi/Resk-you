import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleBlueClickableText extends StatefulWidget {
  const SingleBlueClickableText({super.key});

  @override
  SingleBlueClickableTextState createState() => SingleBlueClickableTextState();
}

class SingleBlueClickableTextState extends State<SingleBlueClickableText> {
  SingleBlueClickableTextState();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Get.toNamed("/first_aid"),
        child: const Text("Menu gestes 1er secours"));
  }
}
