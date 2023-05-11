import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/action_bleeding.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/bleeding_stop.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/compress.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/foreign_body.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/garrot.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/pad.dart';

class MainBleeding extends StatefulWidget {
  const MainBleeding({super.key});

  @override
  MainBleedingState createState() => MainBleedingState();
}

class MainBleedingState extends State<MainBleeding> {
  String state = "foreign_body";

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  @override
  initState() {
    super.initState();
    changePage(state);
  }

  var page;

  changePage(state) {
    if (state == "foreign_body") page = ForeignBody(updateState: changeState);
    if (state == "garrot") page = Garrot(updateState: changeState);
    if (state == "compress") page = Compress(updateState: changeState);
    if (state == "pad") page = Pad(updateState: changeState);
    if (state == "action_bleeding") {
      page = ActionBleeding(updateState: changeState);
    }

    if (state == "bleeding_stop") page = BleedingStop(updateState: changeState);
  }

  MainBleedingState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
