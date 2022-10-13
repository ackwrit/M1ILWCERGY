import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/View/dashboard_view.dart';
import 'package:untitled/View/register_View.dart';
import 'package:untitled/services/FirestoreHelper.dart';
import 'package:untitled/services/constants.dart';

class SocialPageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialPageViewState();
  }

}

class SocialPageViewState extends State<SocialPageView>{
  //variable
  String mail = "";
  String password  = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bienvenue dans l'antre du massage et de la relaxation",
                style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600
          ),
            textAlign: TextAlign.center,
          ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (newValue){
                  setState(() {
                    mail = newValue;
                  });

                },
                decoration: const InputDecoration(
                  hintText: "Entrer une adresse mail",
                ),




              ),
              const SizedBox(height: 10),

              TextField(
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Entrer un mot de passe",
                ),
              ),
              const SizedBox(height: 10),


              ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().connect(mail, password).then((value) {
                      myGlobalUser = value;
                      //aller sur la nouvelle page
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return DashboardView();
                          }
                      ));
                    }).catchError((error){
                      //afficher popUP
                    });

                  },
                  child: const Text("Connexion")
              ),
              const SizedBox(height: 10),


              ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: (){

                  },
                  label: const Text("Google")
              ),

              const SizedBox(height: 10),



              ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.facebook),
                  onPressed: (){

                  },
                  label: const Text("Facebook")
              ),

              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return RegisterView();
                        }
                    ));

                  },
                  child: const Text("Inscription")
              )


            ],
          )),
    );
  }

}