import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/wound/action_wound.dart';
import 'package:resk_you_mobile/components/first_aid/wound/hygiene.dart';
import 'package:resk_you_mobile/components/first_aid/wound/list_wound.dart';
import 'package:resk_you_mobile/components/first_aid/wound/wound_body.dart';
import 'package:resk_you_mobile/components/first_aid/wound/positione_wound.dart';

class MainWound extends StatefulWidget {
  const MainWound({super.key});

  @override
  MainWoundState createState() => MainWoundState();
}

class MainWoundState extends State<MainWound> {
  String state = "list_wound";

  @override
  initState() {
    super.initState();
    changePage(state);
  }

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  var page;

  changePage(state) {
    if (state == "list_wound") page = ListWound(updateState: changeState);
    if (state == "wound_body") page = WoundBody(updateState: changeState);
    if (state == "position_wound") page = Positione(updateState: changeState);
    if (state == "hygiene") page = Hygiene(updateState: changeState);
    if (state == "action_wound") page = ActionWound(updateState: changeState);
  }

  MainWoundState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
