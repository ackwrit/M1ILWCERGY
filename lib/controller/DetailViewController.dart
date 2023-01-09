import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                print("Je clique mon favoris");
              },
              icon: const FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.red,)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: bodyPage(),
      ),
    );
  }

  Widget bodyPage(){

    //Son pseudo
    // bouton cliquable pour Tchatter
    //Bouton cliquable pour ajouter en favoris l'utilisateur

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(widget.monUtilisateur.avatar!),
          ),
          Text(widget.monUtilisateur.mail,style: const TextStyle(fontSize: 25,color: Colors.black),),
          Text(widget.monUtilisateur.fullName,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
          Text(widget.monUtilisateur.pseudo!,style: const TextStyle(fontSize: 15,color: Colors.purple,fontStyle: FontStyle.italic),),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 30.0,
                shape: const StadiumBorder(),
                backgroundColor: Colors.amber


              ),
                onPressed: (){
                  print("Je veux chatter");
                },
                child: Text("Chat")
            ),
          ),
        ],
      ),
    );
  }
}
