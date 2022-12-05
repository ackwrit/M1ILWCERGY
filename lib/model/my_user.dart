import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/services/constants.dart';


class MyUser {
  //Attributs
  late String id;
  String? pseudo;
  late String nom;
  late String prenom;
  late String mail;
  Position? gps;
  String? avatar;
  bool? genre;
  List? favoris;

  //Getter
  String get fullName {
    return prenom +" "+ nom;
}


  //Constructeur
  MyUser(DocumentSnapshot snapshot){
      bool? provisoireGenre;
      String? provisoirePseudo;
      String? provisoireAvatar;
      List? provisoireFavoris;
      id = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      nom = map["NOM"];
      prenom = map["PRENOM"];
      mail = map["MAIL"];
      gps = map["GPS"];

      provisoireFavoris = map["FAVORIS"];
      if(provisoireFavoris == null){
        favoris = [];
      }
      else
        {
          favoris = provisoireFavoris;
        }

      provisoirePseudo = map["PSEUDO"];
      if(provisoirePseudo == null){
        pseudo = "";
      }
      else
        {
          pseudo = provisoirePseudo;
        }

      provisoireAvatar = map["AVATAR"];
      if(provisoireAvatar == null){
        avatar = avatarDefault;
      }
      else
        {
          avatar = provisoireAvatar;
        }


      if(provisoireGenre == null){
        genre = null;
      }
      else
      {
        genre = provisoireGenre;
      }

  }

  MyUser.empty(){
    id ="";
    nom ="";
    prenom="";
    mail ="";
  }



  //Méthode
}