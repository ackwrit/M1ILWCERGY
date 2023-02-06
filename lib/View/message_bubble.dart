import 'package:flutter/material.dart';
import 'package:untitled/model/my_message.dart';
import 'package:untitled/model/my_user.dart';

class MessageBubble extends StatefulWidget {
  Message message;
  MyUser destinataire;
  MyUser emetteur;
  MessageBubble({Key? key, required this.message, required this.destinataire, required this.emetteur}) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: WidgetBubble(widget.message.emetteur == widget.emetteur.id),
      ),
    );
  }

  List<Widget> WidgetBubble(bool moi){
    //suivant le destinaire le message va être à gauche ou à droite
    CrossAxisAlignment alignment = (moi)?CrossAxisAlignment.end : CrossAxisAlignment.start;
    Color colorBubble = (moi)? Colors.green : Colors.purple;
    Color textColor = (moi)? Colors.white : Colors.black;
    return <Widget>[
      Expanded(
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: colorBubble,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(widget.message.message,style: TextStyle(color: textColor),),
                ),
              )

            ],
          )
      )
    ];


  }
}
