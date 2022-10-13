import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/dashboard_view.dart';
import 'package:untitled/services/FirestoreHelper.dart';
import 'package:untitled/services/constants.dart';

class RegisterView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterViewState();
  }

}

class RegisterViewState extends State<RegisterView>{
  //Variable
  TextEditingController? nom = TextEditingController();
  TextEditingController? prenom = TextEditingController();
  TextEditingController? mail = TextEditingController();
  TextEditingController? password = TextEditingController();



  //méthode
  popUp(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isAndroid){
            return AlertDialog(
              title: const Text("Erreur"),
              content: const Text("Votre adresse n'est pas valide"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                },
                    child: const Text("Ok"))
              ],
            );
          }
          else
            {
              return CupertinoAlertDialog(
                title: const Text("Erreur"),
                content: const Text("Votre adresse n'est pas valide"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      child: const Text("Ok"))
                ],

              );
            }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: bodyPage(),
   );
  }

  Widget bodyPage(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nom,
              decoration: const InputDecoration(
                hintText: "Entrer votre nom"
              ),
            ),
            const SizedBox(height: 10,),

            TextField(
              controller: prenom,
              decoration: const InputDecoration(
                  hintText: "Entrer votre prénom"
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: mail,
              decoration: const InputDecoration(
                  hintText: "Entrer votre adresse mail"
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Entrer votre mot de passe"
              ),
            ),
            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){
                  FirestoreHelper().register(nom!.text, prenom!.text, mail!.text, password!.text).then((value){
                    myGlobalUser = value;
                    //Aller sur la nouvelle page Dashboard
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return DashboardView();
                        }
                    ));
                  }).catchError((onError){
                    //Afficher popUp
                    popUp();
                  });

                },
                child: const Text("Inscription")
            )
          ],
        ));
  }

}