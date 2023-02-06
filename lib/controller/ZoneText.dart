import 'package:flutter/material.dart';
import 'package:untitled/model/my_user.dart';
import 'package:untitled/services/FirestoreHelper.dart';

class ZoneText extends StatefulWidget {
  MyUser moi;
  MyUser destinataire;
  ZoneText({Key? key, required this.moi, required this.destinataire}) : super(key: key);

  @override
  State<ZoneText> createState() => _ZoneTextState();
}

class _ZoneTextState extends State<ZoneText> {
  //variable
  TextEditingController controllerText = TextEditingController();



  //fonction
  _sendButtonPressed(){
    //Vérifation si le message n'est pas nulle ou vide
    if(controllerText != null && controllerText.text != ''){
      String message = controllerText.text;
      //Envoie du message dans la base
      FirestoreHelper().sendMessage(message, widget.destinataire, widget.moi);

      setState(() {
        controllerText.text = '';
      });
      FocusScope.of(context).requestFocus(FocusNode());


    }



  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
              child: TextField(
                controller: controllerText,
                decoration: const InputDecoration.collapsed(
                    hintText: "écrivez votre message",
                ),
                maxLines: null,
              )
          ),
          IconButton(
              onPressed: _sendButtonPressed,
              icon: const Icon(Icons.send)
          )
        ],
      ),
    );
  }
}


