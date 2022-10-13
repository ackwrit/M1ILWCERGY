import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper{

  //Attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");




  //Méthode


  //Inscription de l'utlisateur
  register(String nom,String prenom,String mail,String password) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid =resultat.user!.uid;
    Map<String,dynamic> map = {
      "NOM":nom,
      "PRENOM":prenom,
      "MAIL":mail
    };
    addUser(uid, map);

  }


  //Connexion utilisateurs
  connect(String mail, String password) async {
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);


  }
  //ajouter un utilisateur
  addUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
  }



  //mettre à jours les infos de l'utilisateurs



  //Supprimer l'utilisateur


  //Stocker les images

}