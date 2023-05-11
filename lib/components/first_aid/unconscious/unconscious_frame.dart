import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/Menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/Menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/first_aid/unconscious/main_uncounscious.dart';

class UnconsciousFrame extends StatelessWidget {
  const UnconsciousFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: Center(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            child: Text(
              "Ne parle pas / Insconscient".toUpperCase(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Flexible(
              child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.95,
            alignment: Alignment.center,
            child: MainUnconscious(),
          )),
        ],
      )),
    );
  }
}
