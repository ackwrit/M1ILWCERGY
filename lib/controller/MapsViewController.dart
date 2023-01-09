import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/controller/MapsController.dart';
import 'package:untitled/controller/NoDataMapsController.dart';
import 'package:untitled/services/LocationManager.dart';

class MapsViewController extends StatefulWidget {
  const MapsViewController({Key? key}) : super(key: key);

  @override
  State<MapsViewController> createState() => _MapsViewControllerState();
}

class _MapsViewControllerState extends State<MapsViewController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: LocationManager().start() ,
        builder: (context,position){
          if(position.hasData){
            //Si il arrive à trouver une position GPS alors affiche la carte
            return MapsController(maPosition: position.data!,);
          }
          else
            {
              // Pas trouver de position GPS
              return NoDataMapsController();
            }
        },
    );
  }
}
