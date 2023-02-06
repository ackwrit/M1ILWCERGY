import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled/model/my_user.dart';

class FirestoreHelper{

  //Attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");
  final cloudConversation = FirebaseFirestore.instance.collection("CONVERSATIONS");




  //Méthode


  //Inscription de l'utlisateur
  Future <MyUser> register(String nom,String prenom,String mail,String password) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid =resultat.user!.uid;
    Map<String,dynamic> map = {
      "NOM":nom,
      "PRENOM":prenom,
      "MAIL":mail
    };
    addUser(uid, map);
    //recuperer
    return getUser(uid);


  }


  //Connexion utilisateurs
  Future<MyUser>connect(String mail, String password) async {
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
    return getUser(resultat.user!.uid);


  }

  //récupération des éleménts d'un utilisateur

  Future <MyUser> getUser(String uid) async{
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return MyUser(snapshot);


  }
  //ajouter un utilisateur
  addUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
  }



  //mettre à jours les infos de l'utilisateurs
  updateUser(String uid , Map<String,dynamic>map){
    cloudUsers.doc(uid).update(map);
  }



  //Supprimer l'utilisateur
  deleteUser(){
    cloudUsers.doc(auth.currentUser!.uid).delete();
    auth.currentUser!.delete();

  }


  //Stocker les images
  Future <String>stockageImage(String nameImage,Uint8List data) async{
    //Stocker l'image dans la base
    TaskSnapshot snapshot = await storage.ref("profil/$nameImage").putData(data);
    //récupérer le lien de l'image dans la base de donnée
    String urlImage = await snapshot.ref.getDownloadURL();
    return urlImage;

  }

  //Envoie de message
  sendMessage(String message, MyUser destinataire , MyUser emetteur){
    DateTime date = DateTime.now();
    Map<String,dynamic> map = {
      "EMETTEUR": emetteur.id,
      "DESTINATAIRE": destinataire.id,
      "HEURE": date,
      "MESSAGE":message
    };
    String id = date.microsecondsSinceEpoch.toString();
    addMessage(getMessageRef(destinataire.id, emetteur.id, id), map);
    addConversation(emetteur.id, getConversation(emetteur, destinataire, message, date));
    addConversation(destinataire.id, getConversation(emetteur, destinataire, message, date));

  }

  Map<String,dynamic> getConversation(MyUser emetteur, MyUser destinataire, String message, DateTime date){
    Map<String,dynamic> map = destinataire.toMap();
    map["SENDER"]= emetteur.id;
    map["LASTMESSAGE"]= message;
    map["HEURE"]= date;
    map["DESTINAIRE"]= destinataire.id;
    return map;
  }


  String getMessageRef(String destinataire , String emeteur , String idDate){
    String resultat = "";
    List<String> liste = [destinataire,emeteur];
    liste.sort((a,b)=>a.compareTo(b));
     for (var x in liste){
       resultat += x+"+";
     }
     resultat = resultat + idDate;
     return resultat;
  }


  addMessage(String uid, Map<String,dynamic> map){
    cloudMessages.doc(uid).set(map);
  }

  addConversation(String uid , Map<String,dynamic>map){
    cloudConversation.doc(uid).set(map);

  }

}