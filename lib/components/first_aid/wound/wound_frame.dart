import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/first_aid/wound/main_wound.dart';

class WoundFrame extends StatelessWidget {
  const WoundFrame({super.key});

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
              "Plaie".toUpperCase(),
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
            child: MainWound(),
          )),
        ],
      )),
    );
  }
}
