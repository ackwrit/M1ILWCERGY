import 'package:flutter/material.dart';
import 'package:untitled/controller/ZoneText.dart';
import 'package:untitled/model/my_user.dart';
import 'package:untitled/controller/message_controller.dart';

class ChatController extends StatefulWidget {
  MyUser emmetteur;
  MyUser destinataire;
  ChatController({Key? key, required this.emmetteur, required this.destinataire}) : super(key: key);

  @override
  State<ChatController> createState() => _ChatControllerState();
}

class _ChatControllerState extends State<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destinataire.fullName),

      ),
      body: bodyPage(),
    );





  }

  Widget bodyPage(){
    return  Container(
        child : InkWell(
          onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: [
              //partie ou les messages apparaissent
              Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    //Message
                    child : MessageController(emeteur: widget.emmetteur,destinataire: widget.destinataire)
                  )
              ),

              //Division
              const Divider(height: 1.5,),

              // on tape le message à envoyer
              ZoneText(moi: widget.emmetteur, destinataire: widget.destinataire)


            ],
          ),
        )
    );
  }
}
