import 'package:flutter/material.dart';
import '../../services/interfaces/client/beacon.dart';
import '../../services/models/beacon.dart';

class BeaconDetailItem extends StatefulWidget {
  Beacon beacon;
  BeaconDetailItem(this.beacon, {super.key});

  @override
  BeaconDetailState createState() => BeaconDetailState();
}

class BeaconDetailState extends State<BeaconDetailItem> {
  BeaconClientInterface beaconClientInterface = BeaconClientInterface();

  @override
  Widget build(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Text("ETAT".toUpperCase())
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text("ADRESSE".toUpperCase()),
                        Text(widget.beacon.address?.addressCountry ??
                            "Aucune adresse"),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Text("CODE POSTAL".toUpperCase())
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Text("NUMERO DE SERIE".toUpperCase())
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Text("STATUS".toUpperCase())
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("${widget.beacon.etat}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("${widget.beacon.address?.addressCity}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("${widget.beacon.address?.addressZipcode}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("${widget.beacon.serialNumber}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("${widget.beacon.beaconStatus}")],
                ),
              ],
            ),
          ),
        ],
      ));
}
