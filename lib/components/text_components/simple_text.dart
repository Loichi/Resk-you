import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleText extends StatelessWidget {
  String text;
  Color color;

  String page;

  SimpleText(this.text, this.color, this.page, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Get.toNamed(page);
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.15,
          color: color,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      );
}
