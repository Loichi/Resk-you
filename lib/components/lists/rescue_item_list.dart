import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/models/beacon.dart';

class RescueListItemView extends StatefulWidget {
  //variable qui va recuperer un sting afin de savoir quel icone l'on va utiliser
  String localisation;
  Beacon balise;

  RescueListItemView(this.localisation, this.balise, {super.key});

  @override
  RescueListItemState createState() => RescueListItemState();
}

class RescueListItemState extends State<RescueListItemView> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
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
                      child: Column(children: [
                        Text("Need info bdd"),
                        Text(widget.balise.address?.addressStreet ?? ""),
                        Text("Need info bdd"),
                      ]),
                    ),
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
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
}
