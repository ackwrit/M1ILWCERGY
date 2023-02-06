
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  //attributs
  late String id;
  late String emetteur;
  late String destinataire;
  late String message;
  DateTime heure = DateTime.now();


  //constructeur
  Message(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    emetteur = map["EMETTEUR"];
    destinataire = map["DESTINATAIRE"];
    Timestamp provisoire = map["HEURE"];
    message = map["MESSAGE"];
    heure = provisoire.toDate();

  }

}