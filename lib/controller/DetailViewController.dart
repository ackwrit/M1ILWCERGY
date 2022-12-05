import 'package:flutter/material.dart';
import 'package:untitled/model/my_user.dart';

class DetailViewController extends StatefulWidget {
  MyUser monUtilisateur;
  DetailViewController({Key? key, required this.monUtilisateur}) : super(key: key);

  @override
  State<DetailViewController> createState() => _DetailViewControllerState();
}

class _DetailViewControllerState extends State<DetailViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    //Nom et le prénom de la personne
    //Son pseudo
    // Son avatar
    // bouton cliquable pour tchatter
    //Bouton cliquable pour ajouter en favoris l'utilisateur

    return Text("Je suis dans la nouvlle page");
  }
}
