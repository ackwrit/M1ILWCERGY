import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/my_message.dart';
import 'package:untitled/model/my_user.dart';
import 'package:untitled/services/FirestoreHelper.dart';
import 'package:untitled/View/message_bubble.dart';

class MessageController extends StatefulWidget {
  MyUser destinataire;
  MyUser emeteur;
  MessageController({Key? key,required this.destinataire,required this.emeteur}) : super(key: key);

  @override
  State<MessageController> createState() => _MessageControllerState();
}

class _MessageControllerState extends State<MessageController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreHelper().cloudMessages.orderBy("HEURE",descending: false).snapshots(),
        builder: (context,snapshot){
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }
            else
              {
                List documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                    itemBuilder: (context,index){
                      Message discussion = Message(documents[index]);
                      if(discussion.emetteur == widget.emeteur.id && discussion.destinataire == widget.destinataire.id || discussion.emetteur ==widget.destinataire.id && discussion.destinataire == widget.emeteur.id){
                        return MessageBubble(message: discussion, destinataire: widget.destinataire, emetteur: widget.emeteur);
                      }
                      else
                        {
                          return Container();
                        }
                    }
                );
              }
        }
    );
  }
}
