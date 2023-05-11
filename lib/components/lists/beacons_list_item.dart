import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/beacon.dart';

import 'package:resk_you_mobile/services/models/beacon.dart';

class BeaconListItemView extends StatefulWidget {
  //variable qui va recuperer un sting afin de savoir quel icone l'on va utiliser
  String localisation;
  Beacon balise;

  BeaconListItemView(this.localisation, this.balise, {super.key});

  @override
  BeaconListItemState createState() => BeaconListItemState();
}

class BeaconListItemState extends State<BeaconListItemView> {
  BeaconClientInterface beaconClientInterface = BeaconClientInterface();

  late String beaconName = "";

  @override
  initState() {
    super.initState();
    getBeaconName();
  }

  getBeaconName() async {
    var beaconNamed =
        await beaconClientInterface.getBeaconName(widget.balise.id);
    setState(() {
      beaconName = beaconNamed;
    });
  }

  getBeaconsInfo() {
    return Column(children: [
      Text(beaconName),
      Text(widget.balise.idHelpLife ?? ""),
    ]);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(children: [
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            child: const Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: getBeaconsInfo()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ]),
      );
}
