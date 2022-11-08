import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/services/constants.dart';


class MyUser {
  //Attributs
  late String id;
  String? pseudo;
  late String nom;
  late String prenom;
  late String mail;
  //gps,
  String? avatar;
  bool? genre;

  //Getter
  String get fullName {
    return prenom +" "+ nom;
}


  //Constructeur
  MyUser(DocumentSnapshot snapshot){
      bool? provisoireGenre;
      String? provisoirePseudo;
      String? provisoireAvatar;
      id = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      nom = map["NOM"];
      prenom = map["PRENOM"];
      mail = map["MAIL"];

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