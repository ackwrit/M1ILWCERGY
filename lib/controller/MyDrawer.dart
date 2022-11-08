import 'package:flutter/material.dart';
import 'package:untitled/services/constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Afficher le logo/image
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(myGlobalUser.avatar!),
        ),



        //Afficher le mail
        Text(myGlobalUser.mail),


        // Pseudo
        Text(myGlobalUser.pseudo!),

        //Afficher le nom et prénom de l'utilsateur

        Text(myGlobalUser.fullName),

        //Text("${myGlobalUser.prenom} ${myGlobalUser.nom}") cette ligne est identique à la ligne précédente





      ],
    );
  }
}

